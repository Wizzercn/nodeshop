  function returnUnique(arr,checkarr){
    var result = [], hash = {};
    for(var i = 0, elem; (elem = arr[i]) != null; i++){
      if(!hash[elem] && elem != '' && checkarr.indexOf(elem) < 0){
        result.push(elem);
        hash[elem] = true;
      }
    }
    return result;
  }

  function changeArr(arr){
    var result = [];
    for(var i in arr){
      for(var j in arr[i]){
        if(arr[i][j] != ''){
          result.push(arr[i][j]);
        }
      }
    }
    return result;
  }

  function removeHas(arr,item){
    var ar = [];
    $.each(arr,function(i,o){
      var ie = item.indexOf(o);
      if(ie < 0)ar.push(o);
    })
    return ar;
  }

  function returnSelect(){
    var specChose = [];
    $(".spec_store").each(function(){
      if($(this).val().length > 0){
        specChose.push($(this).val());
      }
    })
    return specChose;
  }

  function returnList(){
    var list = '';
    $(".spec_store").each(function(){
      if($(this).val().length > 0){
        list += $(this).parent().find('input').data('speclist') + ',';
      }
    })
    return list;
  }
  function initializeSpec(checkload){
    var specLists = '';
    specChose = returnSelect();
    selectLength = specChose.length;
    var speChosecStr = specChose.join('*');
    var specChoseLength = specChose.length;
    var allHasSpec = removeHas(specObj,specChose);
    specLists = returnList();
    var specChoseNew = [];
    if(specChose.length > 1){
      if(specChose.length < specLength){
        specChoseNew.push(specChose);
      }
      $.each(specChose,function(a,b){
        specChose = returnSelect();
        specChose.splice(a,1);
        specChoseNew.push(specChose);
      });
    }else{
      specChoseNew = [specChose];
    }
    var specAll = [];
    $.each(specChoseNew,function(a,b){
      var len = b.length;
      var specOne = [];
      $.each(specHas,function(c,d){
        var i = 0;
        $.each(b,function(e,f){
          if(d.indexOf(f) > -1){
            d = d.replace(f,'');
            i++;
          }
        })
        if(i == len){
          d = d.split('*');
          for(var j in d){
            if(d[j] == ''){
              d.splice(j,1);
            }
            if(specChoseLength > 1 && specChoseLength < specLength && b.length < specChoseLength){
              if(specLists.indexOf(d[j]) < 0)d.splice(j,1);
            }
          }
          specOne.push(d);
        }
      });
      if(specChoseNew.length == 1){
        $.each(specchecklist,function(i,o){
          if(o.indexOf(specChoseNew[0][0]) > -1){
            for(var j in o){
              if(o[j] != specChoseNew[0][0])specOne.push([o[j]]);
            }
          }
        });
      }
      specOne = changeArr(specOne);
      specAll.push(specOne);
    });
    specAll = changeArr(specAll);
    specAll = returnUnique(specAll,speChosecStr);
    $.each(allHasSpec,function(i,o){
      var ind = specAll.indexOf(o);
      if(ind > -1){
        $("span[name='"+o+"']").addClass('t_sizeb').removeClass('t_sizec').data('checkclick','2');
      }else{
        $("span[name='"+o+"']").addClass('t_sizec').removeClass('t_sizeb').data('checkclick','3');;
      }
    });
    if(!checkload){
      if(selectLength == specLength){
        var specchose = returnSelect();
        for(var s in specList){
          var cwg = 0;
          $.each(specchose,function(m,n){
            if(s.indexOf(n) > -1)cwg++;
          });
          if(cwg == specLength){
            var xprice = specList[s]['price'];
            var xpriceMarket = specList[s]['priceMarket'];
            var xstock = specList[s]['stock'];
            var xid = specList[s]['id'];
            break;
          }
        }
        $('.xsj').html('&yen;'+xprice);
        $('.scj').html('&yen;'+xpriceMarket);
        $('.kus').html('(库存'+xstock+unit+')');
        if(isLvP){
          $.post("/public/shop/wap/goods/getLvPrice",
          {
            lvid:lvid,
            dis_count:dis_count,
            productid:xid,
            price:xprice
          },
          function(data){
            $('.hyj').html('&yen;'+data.msg);
          }
        );
      }
    }
  }
};
$(function(){
  $('.specselect').on('click',function(){
    if($(this).data('checkclick') == 2){
      $('#bgcc').removeClass('bgcc');
      $('#bgww').hide();
      $('#bgcl').hide();
      var specname = $(this).data('specvalue');
      var specvalue = $(this).data('value');
      var imgurl = $(this).data('imgurl');
      $(this).parent().find('input').val(specname);
      var specChose = [];
      var selectLength = 0;
      specChose = returnSelect();
      if($(this).hasClass('t_sizebon')){
        $(this).parent().find('input').val('');
        $(this).removeClass('t_sizebon').addClass('t_sizeb');
        specChose = returnSelect();
        if(imgurl != ''){
          $('#fbigimg').hide();
        }
      }else{
        $(this).addClass("t_sizebon").siblings().removeClass("t_sizebon");
        $(this).removeClass("t_sizeb").siblings().addClass("t_sizeb");
        if(imgurl != ''){
          /*
          if(imgurl.indexOf('?') > -1){
            imgurl = imgurl.substring(0,imgurl.indexOf('?'));
          }
          */
          $('#po-head-img').attr('src',imgurl);
        }
      }
      if(specChose.length < 1){
        $('.specselect').removeClass('t_sizec').addClass('t_sizeb').data('checkclick','2');
      }else{
        initializeSpec(false);
      }
    }
  });
  initializeSpec(true);//初始化规格
});
