function [] = IR_randomname()
Files= dir(strcat(pwd, '\images\*.jpg'));
    r= randperm(length(Files));
    for m=1: length(Files)
        eval(strcat('!rename',32, strcat(pwd, '\images\'),...
        Files(m).name,32, int2str(r(m)),'.jpg'));
    end

