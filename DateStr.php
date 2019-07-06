<?php
class DateStr{
    
    
    
    public $dateStr;
    private const monthArr=[
        'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September',
        'October', 'November', 'December'
    ];
    
    
    
    /**
     * @params String $date A textual representation of a date acceptable by date_parse()
     */
    public function __construct($date){
        $dateArr = date_parse($date);
        $day='';
        switch($dateArr['day']){
            case 1:
                $day='1<sup>st</sup>';
                break;
            case 2:
                $day='2<sup>nd</sup>';
                break;
            case 3:
                $day='3<sup>rd</sup>';
                break;
            default:
                $day=$dateArr['day'] . '<sup>th</sup>';
                break;
        }
        $month=self::monthArr[$dateArr['month']-1];
        
        $this->dateStr=$month . ' ' . $day . ', ' . $dateArr['year'];
    }
}
?>