Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id A983740465E
	for <lists+linux-cachefs@lfdr.de>; Thu,  9 Sep 2021 09:39:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-zi28hZ_gN6-SDMxgvesEEA-1; Thu, 09 Sep 2021 03:39:07 -0400
X-MC-Unique: zi28hZ_gN6-SDMxgvesEEA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18168102CB76;
	Thu,  9 Sep 2021 07:39:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04AEF1B400;
	Thu,  9 Sep 2021 07:39:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 628864E58F;
	Thu,  9 Sep 2021 07:39:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 186B0wW1016804 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 6 Sep 2021 07:00:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0107463F51; Mon,  6 Sep 2021 11:00:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F019263F57
	for <linux-cachefs@redhat.com>; Mon,  6 Sep 2021 11:00:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84DE9106656A
	for <linux-cachefs@redhat.com>; Mon,  6 Sep 2021 11:00:54 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-456-KsGQq7zBNde6llon706XYQ-1; Mon, 06 Sep 2021 07:00:49 -0400
X-MC-Unique: KsGQq7zBNde6llon706XYQ-1
Received: from leknes.fjasle.eu ([92.116.67.85]) by mrelayeu.kundenserver.de
	(mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1M6YEz-1mKiSF16Gf-006wug; Mon, 06 Sep 2021 13:00:46 +0200
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
	id B0DE03C06F; Mon,  6 Sep 2021 13:00:41 +0200 (CEST)
Date: Mon, 6 Sep 2021 13:00:41 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org
Message-ID: <YTX02eiVawkpTquX@fjasle.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:/H9DjLa+mnADC9aIrzArNFSQHwrOlJWq7UziF01SrgtYKe3fyS4
	w8n/RCNKHDOjWJPKrESZshtcxMIdjp2GnubrLLAls0AC2rx+JM7YLGNgOjeWfPVgCluiG3I
	c7TPivoD7ytkwANCCZPZkV23ovGWnpgnip6vi38nQkrBEdaqEgoGo77/fKRVMO8jgohNe54
	AKv7WbI5NQ8xV0E6H+Iig==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rJuJ/9MTm2k=:Cc1uw+93Nk28J9in4EW46Z
	oSQ9x1kyGNjy64Uv8x3FrAQ9SAkwOH5eziVP/vJFVlOglQXkAxSPrUeDy22B1iq9t89l27z5C
	VfZa6DCO6nSPSSE2DXZcIW/m+1S0/BLTM9BWsS9K6e6sKe5HOdwOV2ni4S5jNb0YIUyozvspl
	kLzo7g6n81x2JhRuSQkspIsTI1yep2MQcq0o2iM/BQRLIRYtZMi+o1/hw+KC2R1JBsDIEJ4+g
	NQNjwk4BpRb2ZSOvUUOVvlduMNzxf3Wvlx66kDnuHeGLNYnH2e3GzEdYJoWxqgxWSGmpSN5R4
	CFrAsfS7oOWlYvxS7xUaYqrTlgIa8cWW2c5jjGkV62N81kTIJpU6+to4OHNfG1huncEPTvxkO
	pGoV8Ns41uQs2uRJCzoEHdL2ev9HSveyxq/y0fKiTw71FGaZCp2BLGQYi2LcMYeMuzt6BkdrY
	wy92yoKZueubbRzlmxae3In1HmYwvdCoa4Okz7ItUDKmYmro5Lj4SYEHIDBEW6xR1OCMjtRae
	H09qevX485aX/dshUFb2HN1ISC7CepU5b9suTdhLmS+g5uxSqPa60x3yDmnEsYy4+gZ2CDy/f
	1yimwlZoYnpFkerxPC9EM89MvOKWM5+J0x7lb+f69nBCZxrA0XEZXjEU+q5KSYYHsvSdbDDxM
	XhP2TQx1ZuB1UGvVJXDYpum8+fc+M+HSE+2VTeFjn/ved34ToyB07jZ/GMUMqgRnmBcWP6J5N
	tyytnFWbHC1Lqrs3KxjhsByyxnAckYu/tVIUfA==
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Thu, 09 Sep 2021 03:39:00 -0400
Cc: Nicolas Schier <nicolas@fjasle.eu>
Subject: [Linux-cachefs] [PATCH] [RESEND] fscache: re-match
 MODULE_PARM_DESC() calls to module parameters
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
Content-Disposition: inline
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

--
Resend unmodified as list approval for linux-cachefs@r.c timed out.

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

