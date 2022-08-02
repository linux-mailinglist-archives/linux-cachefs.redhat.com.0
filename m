Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5425875BA
	for <lists+linux-cachefs@lfdr.de>; Tue,  2 Aug 2022 05:03:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659409438;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VXDLMyYeDPWjsqQkaYiDtFFoQAmtBBpzjU8bk8mI6rU=;
	b=H6ah4aV0MjSveIMIG1s9Tks951QYvQFgurveneStKqRFKRXXa6xCllQKaqoJMW3Tw+oiZA
	QlCVxEeC2wSvQzzoBDCHWpOzz/3CVFqutJLHJte3YP+7coy+dykgWR0S085esxjp3RLkYw
	lK5/6e5wT9eJgZTAE+uZWSnu543Cnp4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-rHEIU0DcMjqPl4F5eY0ZQg-1; Mon, 01 Aug 2022 23:03:55 -0400
X-MC-Unique: rHEIU0DcMjqPl4F5eY0ZQg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1F4B185A7BA;
	Tue,  2 Aug 2022 03:03:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C076C28133;
	Tue,  2 Aug 2022 03:03:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 718DC1946A51;
	Tue,  2 Aug 2022 03:03:53 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 694A61946A44 for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  2 Aug 2022 03:03:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 577E01121315; Tue,  2 Aug 2022 03:03:52 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 53C1B1121314
 for <linux-cachefs@redhat.com>; Tue,  2 Aug 2022 03:03:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C190801755
 for <linux-cachefs@redhat.com>; Tue,  2 Aug 2022 03:03:52 +0000 (UTC)
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-gBdh4aQcOy2b8YSzljwnmg-1; Mon, 01 Aug 2022 23:03:47 -0400
X-MC-Unique: gBdh4aQcOy2b8YSzljwnmg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
 TI=SMTPD_---0VL9XT-F_1659409423
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VL9XT-F_1659409423) by smtp.aliyun-inc.com;
 Tue, 02 Aug 2022 11:03:43 +0800
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com,
	linux-cachefs@redhat.com
Date: Tue,  2 Aug 2022 11:03:34 +0800
Message-Id: <20220802030342.46302-2-jefflexu@linux.alibaba.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Linux-cachefs] [PATCH RFC 1/9] cachefiles: improve
 FSCACHE_COOKIE_NO_DATA_TO_READ optimization
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In the following introduced content map feature,
cachefiles_prepare_[read|write] can query if the requested range is
cached through either SEEK_[DATA|HOLE] llseek or a self maintained
bitmap according to object->content_info.

For already existing backing files, content_info can be derived from the
xattr of the backing file. While for newly created tmpfile, content_info
is initialized when the backing file is written for the first time. This
time sequence requires FSCACHE_COOKIE_NO_DATA_TO_READ optimization, so
that llseek will only be called after the first write, i.e. after
content_info has been initializaed.

This patch includes following changes:

1. Enable NO_DATA optimization in cachefiles_prepare_[read|write].

2. Clear FSCACHE_COOKIE_NO_DATA_TO_READ on first write to the backing
   file.

When working in non-on-demand mode, FSCACHE_COOKIE_NO_DATA_TO_READ is
cleared when a_ops->release_folio() called. While for on-demand mode,
there's a retry logic in cachefiles_prepare_read(), i.e. the requested
range will be checked for the second time after the on-demand read, thus
FSCACHE_COOKIE_NO_DATA_TO_READ needs to be cleared for on-demand mode
once write completes.

3. Improve the setting/clearing of FSCACHE_COOKIE_NO_DATA_TO_READ in
on-demand mode.

Since now we rely on NO_DATA optimization when the backing file is
actually tmpfile, the setting of FSCACHE_COOKIE_NO_DATA_TO_READ flag in
on-demand mode is delayed until the size of the backing file is acquired
when copen completes, so that FSCACHE_COOKIE_NO_DATA_TO_READ flag of
tmpfile can be retained.

Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/io.c       | 20 +++++++++++++-------
 fs/cachefiles/ondemand.c |  5 +----
 fs/fscache/cookie.c      |  2 +-
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 000a28f46e59..b513d9bf81f1 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -255,6 +255,7 @@ static void cachefiles_write_complete(struct kiocb *iocb, long ret)
 {
 	struct cachefiles_kiocb *ki = container_of(iocb, struct cachefiles_kiocb, iocb);
 	struct cachefiles_object *object = ki->object;
+	struct fscache_cookie *cookie = object->cookie;
 	struct inode *inode = file_inode(ki->iocb.ki_filp);
 
 	_enter("%ld", ret);
@@ -269,6 +270,9 @@ static void cachefiles_write_complete(struct kiocb *iocb, long ret)
 
 	atomic_long_sub(ki->b_writing, &object->volume->cache->b_writing);
 	set_bit(FSCACHE_COOKIE_HAVE_DATA, &object->cookie->flags);
+	if (cookie->advice & FSCACHE_ADV_WANT_CACHE_SIZE &&
+	    test_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags))
+		clear_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags);
 	if (ki->term_func)
 		ki->term_func(ki->term_func_priv, ret, ki->was_async);
 	cachefiles_put_kiocb(ki);
@@ -413,13 +417,6 @@ static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subrequest *
 		goto out_no_object;
 	}
 
-	if (test_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags)) {
-		__set_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags);
-		why = cachefiles_trace_read_no_data;
-		if (!test_bit(NETFS_SREQ_ONDEMAND, &subreq->flags))
-			goto out_no_object;
-	}
-
 	/* The object and the file may be being created in the background. */
 	if (!file) {
 		why = cachefiles_trace_read_no_file;
@@ -434,6 +431,11 @@ static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subrequest *
 	object = cachefiles_cres_object(cres);
 	cache = object->volume->cache;
 	cachefiles_begin_secure(cache, &saved_cred);
+
+	if (test_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags)) {
+		why = cachefiles_trace_read_no_data;
+		goto download_and_store;
+	}
 retry:
 	off = cachefiles_inject_read_error();
 	if (off == 0)
@@ -510,6 +512,7 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
 			       bool no_space_allocated_yet)
 {
 	struct cachefiles_cache *cache = object->volume->cache;
+	struct fscache_cookie *cookie = object->cookie;
 	loff_t start = *_start, pos;
 	size_t len = *_len, down;
 	int ret;
@@ -526,6 +529,9 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
 	if (no_space_allocated_yet)
 		goto check_space;
 
+	if (test_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags))
+		goto check_space;
+
 	pos = cachefiles_inject_read_error();
 	if (pos == 0)
 		pos = vfs_llseek(file, *_start, SEEK_DATA);
diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
index 1fee702d5529..a317857e2dfd 100644
--- a/fs/cachefiles/ondemand.c
+++ b/fs/cachefiles/ondemand.c
@@ -166,12 +166,9 @@ int cachefiles_ondemand_copen(struct cachefiles_cache *cache, char *args)
 
 	cookie = req->object->cookie;
 	cookie->object_size = size;
-	if (size)
-		clear_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags);
-	else
+	if (size == 0)
 		set_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags);
 	trace_cachefiles_ondemand_copen(req->object, id, size);
-
 out:
 	complete(&req->done);
 	return ret;
diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index 74920826d8f6..49c269c078eb 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -340,7 +340,7 @@ static struct fscache_cookie *fscache_alloc_cookie(
 	cookie->key_len		= index_key_len;
 	cookie->aux_len		= aux_data_len;
 	cookie->object_size	= object_size;
-	if (object_size == 0)
+	if (object_size == 0 && !(advice & FSCACHE_ADV_WANT_CACHE_SIZE))
 		__set_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags);
 
 	if (fscache_set_key(cookie, index_key, index_key_len) < 0)
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

