        let date = new Date();
        let currYear = date.getFullYear();
        let currMonth = date.getMonth();
        let currentMonth = document.querySelector(".current-month");

        let prevLast = new Date(currYear, currMonth, 0);
        let thisLast = new Date(currYear, currMonth, 0);

        let PLDate = prevLast.getDate();
        let PLDay = prevLast.getDay();

        let TLDate = thisLast.getDate();
        let TLDay = thisLast.getDay();

        let prevDates = [];
        if(PLDay !== 6){
            for(let i=0; i < PLDay ;i++){
                prevDates.unshift(PLDate - i);
            }
        }
        let nextDates = [];
        for (let i=1; i < 7 - TLDay; i++){
            nextDates.push(i);
        }
        let thisDates = [...Array(TLDate + 1).keys()].slice(1);
        let dates = prevDates.concat(thisDates, nextDates);

        dates.forEach((date, i) => {
            dates[i] = `<div class="date">${date}</div>`;
        })
        document.querySelector(".date").innerHTML = dates.join('');

        let dateTag = document.querySelector(".date");

        //달력그리기 함수
        let renderCalendar = () => {
            currentMonth.innerHTML=currYear+"년 "+(currMonth+1)+"월";
            let firstDayofMonth = new Date(currYear, currMonth, 1).getDay();
            let lastDateofMonth = new Date(currYear, currMonth+1, 0).getDate();
            let lastDayofMonth = new Date(currYear, currMonth, lastDateofMonth).getDay();
            let lastDateofLastMonth = new Date(currYear, currMonth,0).getDate();
            let daysTag = document.querySelector(".date");
            let liTag = '';
            for(let i = firstDayofMonth; i >0; i--){
                liTag += `<li class= "inactive">${lastDateofLastMonth-i+1}</li>`;
            }
            for (let i=1; i <= lastDateofMonth; i++){
                let isToday =
                    i === date.getDate() &&
                    currMonth === new Date().getMonth() &&
                    currYear === new Date().getFullYear()
                    ?'active'
                    : '';
                liTag += `<li class="${isToday}">${i}</li>`;
            }
            for(let i = lastDayofMonth; i <6; i++){
                liTag += `<li class="inactive">${i-lastDayofMonth+1}</li>`;
            }
            daysTag.innerHTML = liTag;
        }
        //달력그리기
        renderCalendar();
        let prevNextIcon = document.querySelectorAll(".nav .icons");
        prevNextIcon.forEach((icons) => {
            icons.addEventListener('click',() => {
                currMonth = icons.id === 'prev' ? currMonth -1 : currMonth + 1;
                if(currMonth < 1 || currMonth > 11){
                    date= new Date(currYear, currMonth);
                    currYear = date.getFullYear();
                    currMonth = date.getMonth();
                }else{
                    date = new Date();
                }
                renderCalendar();
            });
        }); 
        
        //일정 기록하기
        let inputForKey = document.getElementById("did");
        inputForKey.addEventListener("click",function(){
			process();
		});
		inputForKey.addEventListener("keydown",function(event){
			if(event.keyCode==13)
				process();
		});
		
		let willdoinput = document.getElementById("willdo");
		willdoinput.addEventListener("click",function(){
			process1();
		});
		willdoinput.addEventListener("keydown",function(event){
			if(event.keyCode==13)
				process1();
		});
		
		function process(){
			let input=document.getElementsByTagName("input");
			input[4].value;
			let newLi=document.createElement("li");
			
			let newImg=document.createElement("img");
			let srcNode=document.createAttribute("src");
			let altNode=document.createAttribute("alt");
			srcNode.value="../images/done.png";
			altNode.value="한 일";
			
			let textNode=document.createTextNode(input[4].value);
			
			newImg.setAttributeNode(srcNode);
			newImg.setAttributeNode(altNode);
			newLi.appendChild(newImg);
			newLi.appendChild(textNode);
			
			let uls=document.getElementsByTagName("ul");
			uls[0].appendChild(newLi);
			input.value="";
			
			newLi.addEventListener("click",function(){
				uls[0].removeChild(newLi);
			});
			newLi.addEventListener("mouseover",function(){
				this.style.fontWeight="bolder";
			})
			newLi.addEventListener("mouseout",function(){
				this.style.fontWeight="normal";
			})
		}
		function process1(){
			let input=document.getElementById("willdoIn");
			input.value;
			let newLi=document.createElement("li");
			
			let newImg=document.createElement("img");
			let srcNode=document.createAttribute("src");
			let altNode=document.createAttribute("alt");
			srcNode.value="../images/edit.png";
			altNode.value="할 일";
			
			let textNode=document.createTextNode(input.value);
			
			newImg.setAttributeNode(srcNode);
			newImg.setAttributeNode(altNode);
			newLi.appendChild(newImg);			
			newLi.appendChild(textNode);
			
			let uls=document.getElementsByClassName("willdo");
			uls[0].appendChild(newLi);
			input.value="";
			
			
			newLi.addEventListener("click",function(){
				uls[0].removeChild(newLi);
			});
			newLi.addEventListener("mouseover",function(){
				this.style.fontWeight="bolder";
			})
			newLi.addEventListener("mouseout",function(){
				this.style.fontWeight="normal";
			})
		}
        function reg(){
				location.href="join.do";
			}
			//아이디 안적었는지, 비밀번호 안적었는지 
			function check(){
				if(document.frm.id.value.length==0){
					alert("아이디를 입력하셔야 합니다.");
					document.frm.id.focus();	//해당 input을 선택해 두도록
					return false;
				}
				if(document.frm.pw.value==""){	//위와 같은 코드임
					alert("비밀번호를 입력하셔야 합니다.")
					document.frm.pw.focus();
					return false;
				}
				return true;
			}