# We have 2 coins, one fair P(H) = 0.5 and one loaded P(H) =
# 0.9. Probability of picking each coin is 0.5. One person chooses a
# coin at random, flips it trice and gets HHT as a result. Then the
# other person does the same and gets THH. What is the probablility
# that both persons flipped the same coin.

ph1 = 0.5
pt1 = 1 - 0.5

ph2 = 0.9
pt2 = 1 - ph2

pc1 = 0.5
pc2 = 1 - 0.5

phht1 = ph1 * ph1 * pt1
phht2 = ph2 * ph2 * pt2

pthh1 = pt1 * ph1 * ph1
pthh2 = pt2 * ph2 * ph2

p_same_coin = 0.5
p_diff_coin = 1 - p_same_coin

p_hht_thh_same = ((phht1 * pthh1 + phht2 * pthh2) * p_same_coin) / \
    ((phht1 * pthh1 + phht2 * pthh2) * p_same_coin + (phht1 * pthh2 + phht2 * pthh1) * p_diff_coin)

print p_hht_thh_same


