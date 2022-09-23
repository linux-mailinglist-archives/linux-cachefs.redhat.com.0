Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D65BE5E832F
	for <lists+linux-cachefs@lfdr.de>; Fri, 23 Sep 2022 22:14:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663964086;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ibPyUqkCWqdNTQnTPhQQ2M8jxQOZyR0PpUsljqwnt50=;
	b=AdNqBq30yLMOqXZCXwoW/cBGyRLIusuVya6ABXgVGWXu5wSK1DEveCBkWY4OHGfptfgP0v
	Mz7+5/nIlflOiTvJHw1IvwprJpUpNYYZBD53qZxrxyjTYx8Gyr59dOGSDNRf7DG7T5xYDY
	KMiIIonWw/drwr2XwDiGtR1SouW9hdw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-SdUi1greN_SvjteUbJ0RIQ-1; Fri, 23 Sep 2022 16:14:43 -0400
X-MC-Unique: SdUi1greN_SvjteUbJ0RIQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A84138164CA;
	Fri, 23 Sep 2022 20:14:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B76E2492B04;
	Fri, 23 Sep 2022 20:14:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7F0F21946A41;
	Fri, 23 Sep 2022 20:14:42 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F049919465A4 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 23 Sep 2022 20:14:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E25182027062; Fri, 23 Sep 2022 20:14:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.215])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B83182027061;
 Fri, 23 Sep 2022 20:14:40 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Daire Byrne <daire.byrne@gmail.com>,
	David Howells <dhowells@redhat.com>
Date: Fri, 23 Sep 2022 16:14:39 -0400
Message-Id: <20220923201439.1974099-2-dwysocha@redhat.com>
In-Reply-To: <20220923201439.1974099-1-dwysocha@redhat.com>
References: <20220923201439.1974099-1-dwysocha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Linux-cachefs] [PATCH 1/1] Debug crash in cachefiles_prepare_write
 with NFS netfs conversion
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

---
 fs/cachefiles/io.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 000a28f46e59..1618849dd49b 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -583,11 +583,37 @@ static int cachefiles_prepare_write(struct netfs_cache_resources *cres,
 				    loff_t *_start, size_t *_len, loff_t i_size,
 				    bool no_space_allocated_yet)
 {
-	struct cachefiles_object *object = cachefiles_cres_object(cres);
-	struct cachefiles_cache *cache = object->volume->cache;
+	struct cachefiles_object *object;
+	struct cachefiles_cache *cache;
 	const struct cred *saved_cred;
 	int ret;
-
+	struct fscache_cookie *cookie;
+	struct fscache_volume *volume;
+
+	if (!cres)
+		BUG();
+	if (!fscache_cres_cookie(cres)) {
+		printk("cookie == NULL: cres = %p\n", cres);
+		BUG();
+	}
+	object = cachefiles_cres_object(cres);
+	if (!object) {
+		cookie = fscache_cres_cookie(cres);
+		trace_printk("object == NULL: c=%08x\n", cookie->debug_id);
+		BUG();
+	}
+	if (!object->volume) {
+		cookie = fscache_cres_cookie(cres);
+		trace_printk("volume == NULL: c=%08x\n", cookie->debug_id);
+		BUG();
+	}
+	if (!object->volume->cache) {
+		cookie = fscache_cres_cookie(cres);
+		volume = object->volume->vcookie;
+		trace_printk("cache == NULL: c=%08x V=%08x\n", cookie->debug_id, volume->debug_id);
+		BUG();
+	}
+	cache = object->volume->cache;
 	if (!cachefiles_cres_file(cres)) {
 		if (!fscache_wait_for_operation(cres, FSCACHE_WANT_WRITE))
 			return -ENOBUFS;
-- 
2.31.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

