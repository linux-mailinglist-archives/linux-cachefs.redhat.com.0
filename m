Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C8D44103C
	for <lists+linux-cachefs@lfdr.de>; Sun, 31 Oct 2021 19:40:52 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-9bERtR1rMYed07fXyK1etA-1; Sun, 31 Oct 2021 14:40:48 -0400
X-MC-Unique: 9bERtR1rMYed07fXyK1etA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 467BE362FA;
	Sun, 31 Oct 2021 18:40:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 388763A08;
	Sun, 31 Oct 2021 18:40:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B86C71806D04;
	Sun, 31 Oct 2021 18:40:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19RF7sXP006285 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 27 Oct 2021 11:07:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DC9682026D48; Wed, 27 Oct 2021 15:07:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D81102026D46
	for <linux-cachefs@redhat.com>; Wed, 27 Oct 2021 15:07:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 079868027FB
	for <linux-cachefs@redhat.com>; Wed, 27 Oct 2021 15:07:52 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
	[209.85.216.54]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-406-bK8MPwxKMVm0TL42UnU7Hw-1; Wed, 27 Oct 2021 11:07:48 -0400
X-MC-Unique: bK8MPwxKMVm0TL42UnU7Hw-1
Received: by mail-pj1-f54.google.com with SMTP id
	oa12-20020a17090b1bcc00b0019f715462a8so2296895pjb.3; 
	Wed, 27 Oct 2021 08:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cXTwAPJ+9CrT9PXvZbLyy/kVLXgo+ZtbEyaILHUCVEU=;
	b=oriY526hDE+kQQYJYl4v6OiGlo8cS9ZoQVMwLdFb9jhTkbHAur7yJ21L4jqG+BNBRI
	0Z9Sb0QtyqRDMQaUhZ3H9pUERpc0i3Yq6Ym7RZGIoro0bgTnWJJnbGdKjg3P49sLC5gh
	JabntT0zsFmvX5dtn0dC32pCjNqCAL2VIRiZId1OOVQgnTV3OLSgp9UTNKshuCd7JdcH
	CBaY1xheI/dpBdjo/eXGGZagTed34w1Xd8M1oAupvxW1r/jvJFTZbgXzQ17PG8IgnP9x
	sRqeXQeQagvGLcrti5kSNVrribOZRl+jp//Aw67RnWcwlhpMA+M6Bm6qtsG5wKeYuhYc
	YPSg==
X-Gm-Message-State: AOAM531FlntrcQGkPHBZhb5w4luA+O74NeOLD+SJlbzKEsvNtsjXupJL
	P/Qd4iMwH5dBWA8gqhknmUFYyHpMF69r3KCv
X-Google-Smtp-Source: ABdhPJxaW3IZ8gm0ukoWLYCr4Cc/HY+9od8Z0ViKPWVJOc6pJOdVKmr1Hk4rV7GTZtCWvvLT6wEddw==
X-Received: by 2002:a17:90a:ce97:: with SMTP id
	g23mr3459187pju.149.1635347266390; 
	Wed, 27 Oct 2021 08:07:46 -0700 (PDT)
Received: from localhost.localdomain ([94.177.118.99])
	by smtp.gmail.com with ESMTPSA id
	e14sm249677pfv.192.2021.10.27.08.07.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 27 Oct 2021 08:07:45 -0700 (PDT)
From: Dongliang Mu <mudongliangabcd@gmail.com>
To: David Howells <dhowells@redhat.com>, Jeff Layton <jlayton@kernel.org>
Date: Wed, 27 Oct 2021 23:07:32 +0800
Message-Id: <20211027150732.4158273-1-mudongliangabcd@gmail.com>
MIME-Version: 1.0
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
X-Mailman-Approved-At: Sun, 31 Oct 2021 14:40:40 -0400
Cc: linux-cachefs@redhat.com, Dongliang Mu <mudongliangabcd@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH] fscache: fix GPF in fscache_free_cookie
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If fscache_alloc_cookie encounters memory allocation failure, it will
go to nomem label and invoke fscache_free_cookie. However,
fscache_alloc_cookie assumes current cookie is already linked into
fscache_cookies and directly calls list_del. This assumption does not
hold since list_add is not called in the above scenario. As a result, it
will lead to Null Pointer Dereference. The stack trace is in the
following.

Call Trace:
 __list_del_entry include/linux/list.h:132 [inline]
 list_del include/linux/list.h:146 [inline]
 fscache_free_cookie fs/fscache/cookie.c:71 [inline]
 fscache_free_cookie+0x3f/0x100 fs/fscache/cookie.c:66
 fscache_alloc_cookie+0x2e2/0x300 fs/fscache/cookie.c:195
 __fscache_acquire_cookie fs/fscache/cookie.c:296 [inline]
 __fscache_acquire_cookie+0x132/0x380 fs/fscache/cookie.c:257
 fscache_acquire_cookie include/linux/fscache.h:334 [inline]
 v9fs_cache_session_get_cookie+0x74/0x120 fs/9p/cache.c:60
 v9fs_session_init+0x724/0xa90 fs/9p/v9fs.c:471
 v9fs_mount+0x56/0x450 fs/9p/vfs_super.c:126
 legacy_get_tree+0x2b/0x90 fs/fs_context.c:610
 vfs_get_tree+0x28/0x100 fs/super.c:1498
 do_new_mount fs/namespace.c:2988 [inline]
 path_mount+0xb92/0xfe0 fs/namespace.c:3318
 do_mount+0xa1/0xc0 fs/namespace.c:3331
 __do_sys_mount fs/namespace.c:3539 [inline]
 __se_sys_mount fs/namespace.c:3516 [inline]
 __x64_sys_mount+0xf4/0x160 fs/namespace.c:3516

Fix this by moving the list_add_tail before goto statements.

Fixes: 884a76881fc5 ("fscache: Procfile to display cookies")
Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 fs/fscache/cookie.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index cd42be646ed3..d101e212db74 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -150,6 +150,11 @@ struct fscache_cookie *fscache_alloc_cookie(
 	if (!cookie)
 		return NULL;
 
+	/* move list_add_tail before any error handling code */
+	write_lock(&fscache_cookies_lock);
+	list_add_tail(&cookie->proc_link, &fscache_cookies);
+	write_unlock(&fscache_cookies_lock);
+
 	cookie->key_len = index_key_len;
 	cookie->aux_len = aux_data_len;
 
@@ -186,9 +191,6 @@ struct fscache_cookie *fscache_alloc_cookie(
 	 * told it may not wait */
 	INIT_RADIX_TREE(&cookie->stores, GFP_NOFS & ~__GFP_DIRECT_RECLAIM);
 
-	write_lock(&fscache_cookies_lock);
-	list_add_tail(&cookie->proc_link, &fscache_cookies);
-	write_unlock(&fscache_cookies_lock);
 	return cookie;
 
 nomem:
-- 
2.25.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

