Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A16D45875BD
	for <lists+linux-cachefs@lfdr.de>; Tue,  2 Aug 2022 05:03:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659409438;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=K2b2ynGR4G6FavInaWEBspCR0ZuXCWcm2iggcLluGZg=;
	b=PdF6I9/bUmD9rjCiVnt6O3Wye4PcdSwfwNuibht6/U8SvuFgdZMmiXlk0X8vycYL2IK/TT
	XjIZvKbn8psOivTjcQj0fU27Aoshe0mHxx0D+Iq46mOE4sh5elOCOgyurt4BirfPSpjU9k
	T2+oxlVBA2or/XKo86Dn3sHU4I7xojA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-oBXxYZ6rPFq_d6koBBUraA-1; Mon, 01 Aug 2022 23:03:57 -0400
X-MC-Unique: oBXxYZ6rPFq_d6koBBUraA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02CEB1C05145;
	Tue,  2 Aug 2022 03:03:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EDD40404E4D6;
	Tue,  2 Aug 2022 03:03:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C65B21946A4A;
	Tue,  2 Aug 2022 03:03:56 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7691C1946A41 for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  2 Aug 2022 03:03:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 69A602026985; Tue,  2 Aug 2022 03:03:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 666F72026D07
 for <linux-cachefs@redhat.com>; Tue,  2 Aug 2022 03:03:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C614101A588
 for <linux-cachefs@redhat.com>; Tue,  2 Aug 2022 03:03:55 +0000 (UTC)
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-vtbqjA_ONUWexVpIB2QiYw-1; Mon, 01 Aug 2022 23:03:53 -0400
X-MC-Unique: vtbqjA_ONUWexVpIB2QiYw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R791e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
 TI=SMTPD_---0VL9XpO._1659409428
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VL9XpO._1659409428) by smtp.aliyun-inc.com;
 Tue, 02 Aug 2022 11:03:48 +0800
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com,
	linux-cachefs@redhat.com
Date: Tue,  2 Aug 2022 11:03:40 +0800
Message-Id: <20220802030342.46302-8-jefflexu@linux.alibaba.com>
In-Reply-To: <20220802030342.46302-1-jefflexu@linux.alibaba.com>
References: <20220802030342.46302-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Linux-cachefs] [PATCH RFC 7/9] cachefiles: free content map on
 invalidate
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
Cc: xiang@kernel.org, linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Free the content map when the cached file is invalidated. Also hole
punch the backing content map file if any.

Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/content-map.c | 21 +++++++++++++++++++++
 fs/cachefiles/interface.c   |  1 +
 fs/cachefiles/internal.h    |  1 +
 3 files changed, 23 insertions(+)

diff --git a/fs/cachefiles/content-map.c b/fs/cachefiles/content-map.c
index 949ec5d9e4c9..b73a109844ca 100644
--- a/fs/cachefiles/content-map.c
+++ b/fs/cachefiles/content-map.c
@@ -250,3 +250,24 @@ loff_t cachefiles_find_next_hole(struct cachefiles_object *object,
 	return min_t(loff_t, result * CACHEFILES_GRAN_SIZE,
 			     object->cookie->object_size);
 }
+
+void cachefiles_invalidate_content_map(struct cachefiles_object *object)
+{
+	struct file *file = object->volume->content_map[(u8)object->cookie->key_hash];
+
+	if (object->content_info != CACHEFILES_CONTENT_MAP)
+		return;
+
+	write_lock_bh(&object->content_map_lock);
+	free_pages((unsigned long)object->content_map,
+		   get_order(object->content_map_size));
+	object->content_map = NULL;
+	object->content_map_size = 0;
+
+	if (object->content_map_off != CACHEFILES_CONTENT_MAP_OFF_INVAL) {
+		vfs_fallocate(file, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
+				object->content_map_off, object->content_map_size);
+		object->content_map_off = CACHEFILES_CONTENT_MAP_OFF_INVAL;
+	}
+	write_unlock_bh(&object->content_map_lock);
+}
diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index 4cfbdc87b635..f87b9a665d85 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -409,6 +409,7 @@ static bool cachefiles_invalidate_cookie(struct fscache_cookie *cookie)
 
 	old_file = object->file;
 	object->file = new_file;
+	cachefiles_invalidate_content_map(object);
 	object->content_info = CACHEFILES_CONTENT_NO_DATA;
 	set_bit(CACHEFILES_OBJECT_USING_TMPFILE, &object->flags);
 	set_bit(FSCACHE_COOKIE_NEEDS_UPDATE, &object->cookie->flags);
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 506700809a6d..c674c4e42529 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -187,6 +187,7 @@ extern loff_t cachefiles_find_next_granule(struct cachefiles_object *object,
 					   loff_t start);
 extern loff_t cachefiles_find_next_hole(struct cachefiles_object *object,
 					loff_t start);
+extern void cachefiles_invalidate_content_map(struct cachefiles_object *object);
 
 /*
  * daemon.c
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

