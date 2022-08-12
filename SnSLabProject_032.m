function varargout = SnSLabProject_032(varargin)
% SNSLABPROJECT_032 MATLAB code for SnSLabProject_032.fig
%      SNSLABPROJECT_032, by itself, creates a new SNSLABPROJECT_032 or raises the existing
%      singleton*.
%
%      H = SNSLABPROJECT_032 returns the handle to a new SNSLABPROJECT_032 or the handle to
%      the existing singleton*.
%
%      SNSLABPROJECT_032('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SNSLABPROJECT_032.M with the given input arguments.
%
%      SNSLABPROJECT_032('Property','Value',...) creates a new SNSLABPROJECT_032 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SnSLabProject_032_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SnSLabProject_032_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SnSLabProject_032

% Last Modified by GUIDE v2.5 01-Jul-2021 13:22:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SnSLabProject_032_OpeningFcn, ...
                   'gui_OutputFcn',  @SnSLabProject_032_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before SnSLabProject_032 is made visible.
function SnSLabProject_032_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SnSLabProject_032 (see VARARGIN)

% Choose default command line output for SnSLabProject_032
handles.output = hObject;

% Update handles structure
clc;
guidata(hObject, handles);
set(handles.timeshift,'Value',0)
% UIWAIT makes SnSLabProject_032 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SnSLabProject_032_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global audioin;
audioin=uigetfile('.wav');
[y,fs]=audioread(audioin);
t=linspace(0,length(y)/fs,length(y));
axes(handles.axes1);
plot(t,y);
xlabel('time(sec)');
ylabel('sig,nal amplitude');
title('Signal of Browsed Audio');
axis tight

% --- Executes on button press in record.
function record_Callback(hObject, eventdata, handles)
% hObject    handle to record (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global rec1;
rec_1 = audiorecorder;% creating an object for audio recording
axes(handles.axes1);
title('Recording Audio for 3 sec....')
% disp('Start speaking for voice 1.')
recordblocking(rec_1, 3);
rec1 = getaudiodata(rec_1);

sound(rec1);               %Play recorded audio

plot(rec1);
xlabel('time(sec)');
ylabel('signal amplitude');
title('Signal of Recording');

% --- Executes on button press in listenencryptedsingnal.
function listenencryptedsingnal_Callback(hObject, eventdata, handles)
% hObject    handle to listenencryptedsingnal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%%%%%%%%%%%%%%%%%%%%%%
[sig1, fs] = audioread('Normal-voice.wav'); % import voice
t = (1:length(sig1))/fs; 
axes(handles.axes1);
plot(t, sig1)                               % plot voice
xlabel('time(sec)');
ylabel('signal amplitude');
title('Normal-voice')
[sig2, fs] = audioread('Normal-voice.wav'); % import 2nd signal
t1 = (1:length(sig2))/fs; 
sig2=flipud(sig2);
axes(handles.axes2);
plot(t1, sig2) % plot 2nd signal
xlabel('time(sec)');
ylabel('signal amplitude');
title('Signal ')
w = conv(sig1, sig2);       %convolve signal
sound(w,fs);              %Play colvolved audio
axes(handles.axes3);
plot(w);
xlabel('time(sec)');
ylabel('signal amplitude');
title('Convolved Signal')

% --- Executes on button press in listendecryptedsingnal.
function listendecryptedsingnal_Callback(hObject, eventdata, handles)
% hObject    handle to listendecryptedsingnal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global audioin;
[a, fs] = audioread(audioin);
sound(a,fs);
t=linspace(0,length(a)/fs,length(a));
axes(handles.axes2);
plot(t,a);
xlabel('time(sec)');
ylabel('signal amplitude');
title('Playing Unmodified Signal');
axis tight


% --- Executes on button press in timeshift.
function timeshift_Callback(hObject, eventdata, handles)
% hObject    handle to timeshift (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of timeshift


% --- Executes on button press in timescale.
function timescale_Callback(hObject, eventdata, handles)
% hObject    handle to timescale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of timescale


% --- Executes on button press in timeflip.
function timeflip_Callback(hObject, eventdata, handles)
% hObject    handle to timeflip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of timeflip



% --- Executes on button press in compress.
function compress_Callback(hObject, eventdata, handles)
% hObject    handle to compress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of compress


% --- Executes on button press in expand.
function expand_Callback(hObject, eventdata, handles)
% hObject    handle to expand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of expand


% --- Executes when selected object is changed in selectionbutton.
function selectionbutton_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in selectionbutton 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global audioin;
audiomd=audioin;
switch(get(eventdata.NewValue,'Tag'));
    case 'timeshift'
        [audiomd1, fs1] = audioread(audiomd);
        sound(audiomd1,fs1);
    t1=linspace(0,length(audiomd1)/fs1,length(audiomd1));
    t1=t1+10;                   % Time shifter signal
    axes(handles.axes3);
    plot(t1,audiomd1);
    xlabel('time(sec)');
    ylabel('signal amplitude');
    title('Playing Time Shifted Signal');
    axis tight
    
    case 'timescale'
        [audiomd2, fs2] = audioread(audiomd);
        sound(audiomd2, fs2*2);
    t2=linspace(0,length(audiomd2)/fs2,length(audiomd2));
    t2=t2/2;                    % time scaled signal by 2
    axes(handles.axes3);
    plot(t2,audiomd2);
    xlabel('time(sec)');
    ylabel('signal amplitude');
    title('Playing Time Scaled Signal');
    axis tight
    
    case 'timeflip'
        [audiomd3, fs3] = audioread(audiomd);
        audiomd3=flipud(audiomd3);  % flipped audio
        sound(audiomd3,fs3);  
    t3=linspace(0,length(audiomd3)/fs3,length(audiomd3));
    axes(handles.axes3);
    plot(t3,audiomd3);
    xlabel('time(sec)');
    ylabel('signal amplitude');
    title('Playing Time Fliped Signal');
    axis tight
    
    case 'compress'
        [audiomd4, fs4] = audioread(audiomd);
        sound(audiomd4, fs4*3);
    t4=linspace(0,length(audiomd4)/fs4,length(audiomd4));
    t4=t4/3;                % time compress signal by 3
    axes(handles.axes3);
    plot(t4,audiomd4);
    xlabel('time(sec)');
    ylabel('signal amplitude');
    title('Playing Compressed(3x) Signal');
    axis tight
    
    case 'expand'
        [audiomd5, fs5] = audioread(audiomd);
        sound(audiomd5, fs5/2);
    t5=linspace(0,length(audiomd5)/fs5,length(audiomd5));
    t5=t5*2;                % time expanded signal by 2
    axes(handles.axes3);
    plot(t5,audiomd5);
    xlabel('time(sec)');
    ylabel('signal amplitude');
    title('Playing Expanded(2x) Signal');
    axis tight

end
