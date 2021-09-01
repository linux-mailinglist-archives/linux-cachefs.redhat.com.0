Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id CEDF940465F
	for <lists+linux-cachefs@lfdr.de>; Thu,  9 Sep 2021 09:39:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46--kQaYgxNNpG3leO4e4R_bw-1; Thu, 09 Sep 2021 03:39:07 -0400
X-MC-Unique: -kQaYgxNNpG3leO4e4R_bw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BAE8801B3D;
	Thu,  9 Sep 2021 07:39:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04DAF1B46B;
	Thu,  9 Sep 2021 07:39:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6283B1800FE4;
	Thu,  9 Sep 2021 07:39:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 181K3TRf024386 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 1 Sep 2021 16:03:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 16957207B2DA; Wed,  1 Sep 2021 20:03:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1223820899F3
	for <linux-cachefs@redhat.com>; Wed,  1 Sep 2021 20:03:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 223CF886493
	for <linux-cachefs@redhat.com>; Wed,  1 Sep 2021 20:03:26 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-583-RJ7xC11wOBGayP0SavJY5g-1; Wed, 01 Sep 2021 16:03:22 -0400
X-MC-Unique: RJ7xC11wOBGayP0SavJY5g-1
Received: from leknes.fjasle.eu ([92.116.70.90]) by mrelayeu.kundenserver.de
	(mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1M1HqM-1mIlDi0VIo-002pWJ; Wed, 01 Sep 2021 21:58:12 +0200
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
	id F1FC63C07C; Wed,  1 Sep 2021 21:58:09 +0200 (CEST)
From: Nicolas Schier <nicolas@fjasle.eu>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org
Date: Wed,  1 Sep 2021 21:57:59 +0200
Message-Id: <20210901195759.2166674-1-nicolas@fjasle.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:rDCCjeLjAJM3z5VvVIexmAD/bY3AKKzjqSzuTrUTtirjUuMw1eC
	wwLNRcAtKKm7PqL6iqdIFFIiT7O+AeLSqfPbhrZBS0Ko9k/aYxeztZGZxxiBzVNctz6b88B
	VrxpIoDzGQUs106nftIu3h/TmWYMCtwBFEEV52+5szAi+pdcD1wT+7QUmuftM7tiXkCbLPr
	ynHb5pnVv+e/9PMAInveQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YqhFbsJxnZc=:roSKE9j5OQNLSDtdqjEhxx
	59FECnxfXGjBK1XP2MraBTNVkIP5py+kus0Gkgn2dfXeLFTSffcNSjJA1i7dbJ55bzmK5qwkh
	Yfizowmn8VAbF/9kXqnexWKIu4lJ1GAEoiAJ80beswwdP766aqcXmPnW6U9pPrEEb7CS25QTj
	bGKPtQxFAJHqPwbnvga3LJ85Gap7HBk6o+ob6Wt31AOvZgn/nHRXNsCpbLJtFiFobUTbTZ26e
	cZWqwP1/nFyY4+ypILkAvdq6G9bf00HzJsMGQfaaHyMihOzPd276hcQkRbkqDk6JexWz5RWbS
	sBjM5p2rbMMKLNMEjKqY75Zrdw7pnapGEOS3MvC2o599MzCi/O/shEngG0evHn4eEyjHEBWDj
	Y77oGyM1N/ad0LK3SpYpmDauONg7CrBL0pDWT+2npvCtsXG7yfwEYYhM1JlS6y23304y/kRJK
	XjUmzgnWxEt4LqyJ08FRBXxmvSiwI/k1H314hKl0juRwZ0iuC+pbotTWIHetIPt3W3ELtDXVI
	fdQiEORuEyps140ViTghf/vYAZjmfPN097+uJL06wL2rySkk4SyXrwLMESFCAyuuh0fg+UnGU
	TmSRCnSr0UQ1flONxxxdk5Q2tRPaa/tw/9EjglrK7fch+Fi9+KWMiouF2uCCtK1aoWlFaXd7u
	egs42UV6TU+cdJqsAJbnk+s8CD3RBIqW0ucljpRluLMFAgGbL7V1CgfG6FIbQNzng+A2RbVJ6
	IBOBLGbtPmPA/p1KwNPWRjzWh3I3HOwPIctLbw==
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Thu, 09 Sep 2021 03:39:00 -0400
Cc: Nicolas Schier <nicolas@fjasle.eu>
Subject: [Linux-cachefs] [PATCH] fscache: re-match MODULE_PARM_DESC() calls
	to module parameters
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix calls of MODULE_PARM_DESC() such that the first argument matches the
actual module parameter name.  This changes the 'parm' section in the
output of `modinfo fscache` from:

    parm: defer_lookup:uint
    parm: fscache_defer_lookup:Defer cookie lookup to background thread
    parm: defer_create:uint
    parm: fscache_defer_create:Defer cookie creation to background thread
    parm: debug:uint
    parm: fscache_debug:FS-Cache debugging mask

into:

    parm: defer_lookup:Defer cookie lookup to background thread (uint)
    parm: defer_create:Defer cookie creation to background thread (uint)
    parm: debug:FS-Cache debugging mask (uint)
.

Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
---
 fs/fscache/main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/fscache/main.c b/fs/fscache/main.c
index c1e6cc9091aa..ccb06dc0a6e9 100644
--- a/fs/fscache/main.c
+++ b/fs/fscache/main.c
@@ -22,19 +22,19 @@ MODULE_LICENSE("GPL");
 unsigned fscache_defer_lookup = 1;
 module_param_named(defer_lookup, fscache_defer_lookup, uint,
 		   S_IWUSR | S_IRUGO);
-MODULE_PARM_DESC(fscache_defer_lookup,
+MODULE_PARM_DESC(defer_lookup,
 		 "Defer cookie lookup to background thread");
 
 unsigned fscache_defer_create = 1;
 module_param_named(defer_create, fscache_defer_create, uint,
 		   S_IWUSR | S_IRUGO);
-MODULE_PARM_DESC(fscache_defer_create,
+MODULE_PARM_DESC(defer_create,
 		 "Defer cookie creation to background thread");
 
 unsigned fscache_debug;
 module_param_named(debug, fscache_debug, uint,
 		   S_IWUSR | S_IRUGO);
-MODULE_PARM_DESC(fscache_debug,
+MODULE_PARM_DESC(debug,
 		 "FS-Cache debugging mask");
 
 struct kobject *fscache_root;
-- 
2.30.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

