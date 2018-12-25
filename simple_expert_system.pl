% +----------------------------------------------+
% | BATUHAN TOPALOÐLU 151044026 CSE341 HW3 PART1 |
% +----------------------------------------------+
%
%
% çalýþtýrma sýrasýnda add method formatlarýna bakýlmak istenirse
% 'formats()' çaðrýlabilir.
%
%>>>>>>> conflicts(CourseID1,CourseID2):-
%      Burada kontrolün doðru dönebilmesi için arka planda
%     bu iki dersin ders saatlerinde çakýþma olmuyor olmasý
%     gerekiyor.
%
%     ! Bence çakýþma için sadece zaman çakýþmasý olmasý yeterli,
%     sýnýflarýn ayrý olmasý çakýþma olmadýðý anlamýna gelmez.
%
%>>>>>>> assign(RoomID,CourseID):-
%
%     1- Sýnýfta o dersin ders saati kadar boþ bir saat dilimi olup
%       olmadýðýna bakýlýr.
%
%     2- Sýnýfýn ekipmanlarý dersin gereksinimlerini
%       karþýlýyor mu o kontrol edilir.
%
%     3- Sýnýfýn öðrenci kapasitesi dersin kapasitesine uygun mu diye
%       konrol edilir. O an dersi alan öðrenci sayýsýna deðil, direk
%       dersin kapasitesine göre kontrol ettim.
%
%
%>>>>>>> enroll(StudentID,CourseID):-
%
%     1- Dersin alýndýðý sýnýfýn imkanlarý engelli öðrencilere uygun mu
%       diye kontrol edilir.
%
%     2- Dersin öðrenci kapasitesi yeni öðrenci eklenmeye uygun mu diye
%       kontrol edilir.
%
%
%
%>>>>>>>> add_student(SID,Cours,Hc):-
%
%     1- Daha önce SID de bir öðrenci olup olmadýðý kontrol edilir,
%        varsa iþlem false olur.
%
%     2- Kayýt olanmak istenilen derslerin geçerli birer ders olup
%        olmadýðý kontrol edilir.
%
%     3- Kayýt olunmak istenilen derslerin sýnýflarý öðrenci için uygun
%        koþullara sahip mi diye kontrol edilir.
%
%     4- Kayýt olunmak istenilen sýnýfta boþ kontenjan var mý diye
%        kontrol edilir.
%
%     5- Kayýt olunmak istenilen derslerin saatleri birbirleriyle
%     çakýþýyor mu diye kontrol edilir.
%
%
%>>>>>>>> add_room(RID,Cap,Eq):-
%
%     1- sadece daha önce ayný ID ile bir sýnýf olmamasý yeterli koþul.
%
%
%>>>>>>>> add_course(CID,IID,C,HourList,R,E):-
%
%     1- ayný ID ile daha önce oluþturulmuþ bir kurs var mý diye kontrol
%     edilir.
%
%     2- verilen instructor ID geçerli bir ID mi diye kontrol edilir.
%
%     3- occupancy tablosunu güncellemeyi kullanýcýya býraktým.
%
% ** >>>>>>>> yeni kurs eklendiðinde occupancy tablosunun güncellemesi
% iþini kullanýcý tarafýna býrakýyorum ,güncelleme yapýlmazsa
% hatalý sonuçlar ortaya çýkabilir. Bu bir eksik sayýlabilir sanýrým
% ancak bu kýsmý yetiþtiremedim diyebilirim. Diðer bütün kontrollerimin
% doðru çalýþtýðýný düþünüyorum.
%
%


:-dynamic(room/3).
:-dynamic(instructor/3).
:-dynamic(student/3).
:-dynamic(course/6).
:-dynamic(occupancy/3).

%room(room_ID,Capacity,Equipment)
room(z06,10,[hcapped,projector]).
room(z11,15,[hcapped]).  % 10


%instructor(ýnstructor_ID).
instructor(genc,[projector],[cse341]).
instructor(turker,[smartboard],[cse343]).
instructor(bayrakci,[],[cse331]).
instructor(gozupek,[smartboard],[cse321]).

%student(Student_ID,Cours_list,hcapped)
student(1,[cse341,cse343,cse331],no). % sizin verdiðiniz tabloda derslerin kapasitesi gözetilmeden bir atama yapýlmýþ.
student(2,[cse341,cse343],no).        % bunlar program baþlarken yüklü bilgi olarak geldiði için kontrol etmiyorum.
student(3,[cse341,cse331],no).
student(4,[cse341],no).
student(5,[cse343,cse331],no).
student(6,[cse341,cse343,cse331],yes).
student(7,[cse341,cse343],no).
student(8,[cse341,cse331],yes).
student(9,[cse341],no).
student(10,[cse341,cse321],no).
student(11,[cse341,cse321],no).
student(12,[cse343,cse321],no).
student(13,[cse343,cse321],no).
student(14,[cse343,cse321],no).
student(15,[cse343,cse321],yes).



%course(course_ID,ýnstructor_ID,Capacity,Hour,Room,Needs)
course(cse341,genc,10,4,z06,[hcapped]).
course(cse343,turker,6,3,z11,[]).
course(cse331,bayrakci,5,3,z06,[]).
course(cse321,gozupek,10,4,z11,[]).

%occupancy(Room_ID,Hour,Cours_ID)
occupancy(z06,8,cse341).
occupancy(z06,9,cse341).
occupancy(z06,10,cse341).
occupancy(z06,11,cse341).
occupancy(z06,12,n).
occupancy(z06,13,cse331).
occupancy(z06,14,cse331).
occupancy(z06,15,cse331).
occupancy(z06,16,n).
occupancy(z11,8,cse343).
occupancy(z11,9,cse343).
occupancy(z11,10,cse343).
occupancy(z11,11,n).
occupancy(z11,12,n).
occupancy(z11,13,cse321).
occupancy(z11,14,cse321).
occupancy(z11,15,cse321).
occupancy(z11,16,cse321).


% çalýþtýrma sýrasýnda method formatlarýna bakýlmak istenirse diye
% ekledim.
formats():-
   write('METHOD FORMATS :'),nl,
   write('add_student(Student_ID,[cseXXX,cseXXX,...],handicapped yes/no)'),nl,
   write('add_course(Course_ID,Instruction_ID,Capacity,Hour,Room_ID,Equipment)'),nl,
   write('add_room(Room_ID,Room_Capacity,Room_EquipmentsList)'),nl.


% Check whether there is any scheduling conflict. -->
conflict(CID1,CID2):-
    course_hour(8,CID1,[],C1),  %Kurslarýn ders saatlerinde bir çakýþma var mý diye kontrol edilir.
    course_hour(8,CID2,[],C2),  %Normal hayatta ders çakýþmasý için sadece saatlere baktýðýmýz için burada sýnýflarý kontrol etmiyorum.
    \+compare_lists(C1,C2).


% Check which room can be assigned to a given class. -->
assign(RoomID,CourseID):-
    course(CourseID,_,CC,CH,_,ELM),
    room(Room,RC,RE),
    RC >= CC,                        % kapasitesi yeterli mi diye kontrol edilir.
    include_lists(ELM,RE),           % ders için gerekli ekipmanlarýn sýnýfta olup olmadýðý kontrol edilir.
    free_time(8,Room,0,CH),          % sýnýfta ders için yeterli boþ saat var mý diye kontrol edilir.
    RoomID  =  Room.


% Check whether a student can be enrolled to a given class. -->
enroll(StudentID,CourseID):-

    student(StudentID,_,H),
    course(CourseID,_,Capacity,_,Roomm,_),
    room(Roomm,_,Req),
    (H == yes, HK = hcapped ,include_lists([HK],Req); H == no),
    course_counterr(CourseID,Res),
    Res < Capacity.



% add_student(SID,[H|T],Hc):- add_student(SID,H,T,Hc).
add_student(SID,Cours,Hc):-
    \+ student(SID,_,_),       % Daha önce ID de bir öðrenci olmamalý.
    check_course(Cours),       % girilen kurslarýn geçerli birer kurs olup olmadýðý kontrol edilir.
    check_conflict(Cours,Res), % alýnmak istenen derslerin saatleri çakýþýyor mu diye kontrol edilir.
    Res == 0,
    assertz(student(SID,Cours,Hc)), %uygunluk kontrol edilmeden önce student objesi oluþturulur ancak uygun koþullarý saðlamazsa silinir ve iz býrakmaz.
    (check_available(SID,Cours);retract(student(SID,Cours,Hc)),1 == 2).



% bir sýnýf eklemek için sadece o sýnýf ýd'sinde daha önce bir sýnýf
% olup olmadýðýný kontrol etmek dýþýnda bir koþul aklýma gelmedi o
% yüzden tek bir koþul kontrolü yapýyorum ve yeni sýnýfý oluþturuyorum.
add_room(RID,Cap,Eq):-

    \+ room(RID,_,_),
    assertz(room(RID,Cap,Eq)).


%add_course(Course_ID,Instruction_ID,Capacity,Hour,Room_ID,Equipment)
add_course(CID,IID,C,Hour,R,E):-

    \+ course(CID,_,_,_,_,_),  % course ID daha önce alýnmýþ olmamalý
    instructor(IID,_,_),       %instructor ID geçerli bir ID olmalý
    assertz(course(CID,IID,C,Hour,R,E)),
    (assign(R,CID);retract(course(CID,IID,C,Hour,R,E))). % Course verilen Room a assign edilebilirse sorun yok
                                                         % oluþturulan obje korunur ancak atamaya uygun deðilse silinir.



% Burada bütün sorumluluðu kullanýcýya býrakýyorum. Kullanýcý occupancy
% tablosu inceleyip bir derse sýnýf atadýðýnda her ders saati occupancy
% tablosunu güncellemesi gerekiyor.
add_occupancy(RID,Hour,CID):-
  retract(occupancy(RID,Hour,_)),
  assertz(occupancy(RID,Hour,CID)).


%++++++++++  Y A R D I M C I   K O Þ U L  Ý F A D E L E R Ý +++++++++++
% Bu methodlar dýþarýdan direk kullanýcýnýn kullanmamasý gereken
% yardýmcý koþul ifadeleri


% verilen iki liste arasýnda çakýþan eleman olup olmadýðýný kontrol
% etmek için kullanýlan bir method.
compare_lists([],_).
compare_lists([H|T],L2):-
    \+member(H,L2),
    compare_lists(T,L2).



%bir öðrencinin kayýt olmak istediði dersin geçerli bir ders olup olmadýðýný kontrol ediyor.
check_course([]).
check_course([H|T]):-
    course(H,_,_,_,_,_),
    check_course(T).




% Bu fonksiyon L1 parametresi olarak verilen listenin elemanlarýnýn L2
% listesinde olup olmadýðýný kontrol eder. L1 in bütün elemanlarý L2 de
% varsa True , diðer durumda false döner.
include_lists(L1,L2):-
    length(L1,LL1),
    length(L2,LL2),
    LL1 =< LL2,
    include_backend(L1,L2).

include_backend([],_).
include_backend([H|T],L2):-
    member(H,L2),
    include_backend(T,L2).




% parametre olarak gelen sýnýfta toplam kaç boþ ders saati olduðunu
% hesaplayan fonksiyon.
free_time(18,_,Count,C):- C =< Count.
free_time(Hour,RID,Count,C):-
    Hour < 18,
    occupancy(RID,Hour,CD1),
    CD1 == n,
    Hour1 is Hour + 1,
    K is Count + 1,
    free_time(Hour1,RID,K,C).

free_time(Hour,RID,Count,C):-
    Hour < 18,
    Hour1 is Hour + 1,
    free_time(Hour1,RID,Count,C).




%hours of courses
% bir dersin iþlendiði saatleri bize bir liste halinde döndürür.
% Örn: cse341 için [8,9,10,11]
course_hour(18,CID,Count,Count):- course(CID,_,_,X,_,_),length(Count,Len),Len == X.
course_hour(Hour,CD1,Count,C):-
    Hour < 18,
    occupancy(_,Hour,CD1),
    Hour1 is Hour + 1,
    append(Count,[Hour],Res),
    course_hour(Hour1,CD1,Res,C).

course_hour(Hour,CID,Count,C):-
    Hour < 18,
    Hour1 is Hour + 1,
    course_hour(Hour1,CID,Count,C).



% Verilen course ID ye sahip kursa kaç öðrencinin kayýtlý olduðu
% hesaplayýp döndürür. Orn: cse341 dersi için baþlangýc durumu için
% Res deðeri 10 dur.
course_counterr(CID,Res):- course_counterr(0,CID,[],X), length(X,Res),!.

course_counterr(100,_,Count,Count).

course_counterr(SID,CD1,Count,C):-
    SID < 100,
    student(SID,Courses,_),
    include_lists([CD1],Courses),

    (\+member(SID,Count),append(Count,[SID],Res);member(SID,Count)),
    SID1 is SID + 1,
    course_counterr(SID1,CD1,Res,C).

course_counterr(Hour,CID,Count,C):-
    Hour < 100,
    Hour1 is Hour + 1,
    course_counterr(Hour1,CID,Count,C).




% Parametre olarak gelen course listesindeki derslerin verilen student
% için uygun olduðunu ispatlamak üzerine kurulmuþ bir kontrol.
% bütün dersler uygunsa True herhangi biri uygun deðilse false olur.
check_available(_,[]).
check_available(SID,[H|T]):-
    enroll(SID,H),
    check_available(SID,T).




% bir listede verilen dersler arasýnda conflict durumu var mý diye
% kontrol edilen koþul
check_conflict(List,Res):-check_conflict(List,0,Res),!.
check_conflict([_|[]],O,O).
check_conflict([H|[HTail|TTail]],O,N):-
   (conflict(H,HTail),K is O + 1;K is O),
   check_conflict([HTail|TTail],K,N).



