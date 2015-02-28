format short

[freq text] = textread('jane_freq.txt', '%u %s' );
num = size(freq,1)
freq;
strings = (1:1:num)';

figure
plot(strings, freq);
xlabel('word rank');
ylabel('word frequency');
title('word frequency vs rank');

figure

total = cumsum(freq);
maximum = total(num,1);
plot(strings, (cumsum(freq)/maximum))
hold on

% find half max value
h = findobj(gca,'Type','line');
y=round(get(h,'Ydata')*100)/100;
y(1:1:3000);
half_max = find(y==0.5000); % at what value of X is Y = half mmaximal?
avg_half_max = mean(half_max)
half_max_overall = avg_half_max / num
plot(avg_half_max,0.5,'*')
axis([0 num+1000 0 1.1])
xlabel('rank')
ylabel('cumulative percentage of total tokens')
title('at what rank(r) are ranks 1-r 50% of all tokens?')