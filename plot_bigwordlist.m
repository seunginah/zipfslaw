format long

% read pre-processed data
[text freq] = textread('bigwordlist75k.txt', '%s %u' );
strings = (1:1:75000)';

% plot the rank and frequencies on a log scale
loglog(strings, freq);
xlabel('word rank');
ylabel('word frequency');
title('word frequency vs rank');

figure

total = cumsum(freq);
maximum = total(75000,1);
plot(strings, (cumsum(freq)/maximum))
hold on

% find half max value
h = findobj(gca,'Type','line');
y=get(h,'Ydata');
y(1:1:3000);
half_max = find(y==0.500134503286317) % at what value of X is Y = half mmaximal?
plot(half_max,0.5,'o')
axis([0 80000 0 1.1])
xlabel('rank')
ylabel('cumulative percentage of total tokens')
title('at what rank(r) are ranks 1-r 50% of all tokens?')

threeD = [
55176, 4655;
53359, 4915;
40917, 4149;
40296	4429;
64295	8069;
46835	6323;
64179	6652;	
72157	6331;	
124560	8592;
196808	15174;
6271	1848;
18615	3300;
24731	4177;
39696	6328;
118321	8188;
43491	6096;
23059	4731;

];

all = [1032766	31524;];

figure
plot(threeD(:,1), threeD(:,2), 'o')
hold on
xlabel('tokens');
ylabel('types');
title('types vs. tokens in literature text files')

plot(all(1,1), all(1,2),'*')
legend('files', 'all files')

