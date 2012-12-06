/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

            Timer = []  ;         
            TotalSeconds = [] ;
            function CreateTimer(TimerID, Time,i) {
                if (Time==-666) {
                        Timer[i] = document.getElementById(TimerID);
                        Timer[i].innerHTML = 'In Processing';
                    }                    
                    else {
                        Timer[i] = document.getElementById(TimerID);
                        TotalSeconds[i] = Time;
                        UpdateTimer(i);
                        //alert(TotalSeconds[i]);
                        window.setTimeout(function () { Tick(i)}, 1000);
                    }
            }
            function Tick(i) {
                //alert(TotalSeconds[i]);
                if(TotalSeconds[i] == 0){                    
                    window.location = "index.php";
                }
                TotalSeconds[i] -= 1;
                UpdateTimer(i)
                window.setTimeout(function () { Tick(i) }, 1000);
            }
            function UpdateTimer(i) {
               // alert(TotalSeconds[i]);
                var Seconds = TotalSeconds[i];
                var Days = Math.floor(Seconds / 86400);
                Seconds -= Days * 86400;
                var Hours = Math.floor(Seconds / 3600);
                Seconds -= Hours * (3600);
                var Minutes = Math.floor(Seconds / 60);
                Seconds -= Minutes * (60);
                var TimeStr = (Days+"d " +LeadingZero(Hours) + ":" + LeadingZero(Minutes) + ":" + LeadingZero(Seconds))
                Timer[i].innerHTML = TimeStr;
            }
            function LeadingZero(Time) {
                return (Time < 10) ? "0" + Time : + Time;
            }           
        