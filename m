Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A9E8F2337EB
	for <lists+linux-cachefs@lfdr.de>; Thu, 30 Jul 2020 19:51:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-iZOQw9-sNqKzf8wXugiODg-1; Thu, 30 Jul 2020 13:51:02 -0400
X-MC-Unique: iZOQw9-sNqKzf8wXugiODg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11A5F102C7E9;
	Thu, 30 Jul 2020 17:50:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BBEC5FC31;
	Thu, 30 Jul 2020 17:50:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F83A9A0E6;
	Thu, 30 Jul 2020 17:50:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06UHoNvs017469 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 30 Jul 2020 13:50:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9BB46FED48; Thu, 30 Jul 2020 17:50:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97A731032A8
	for <linux-cachefs@redhat.com>; Thu, 30 Jul 2020 17:50:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B443800260
	for <linux-cachefs@redhat.com>; Thu, 30 Jul 2020 17:50:21 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-218-VyJ6NuUPOnih4B_QtIqUpA-1;
	Thu, 30 Jul 2020 13:50:19 -0400
X-MC-Unique: VyJ6NuUPOnih4B_QtIqUpA-1
Received: from tleilax.com (68-20-15-154.lightspeed.rlghnc.sbcglobal.net
	[68.20.15.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 19AC220809;
	Thu, 30 Jul 2020 17:45:05 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: dhowells@redhat.com
Date: Thu, 30 Jul 2020 13:45:03 -0400
Message-Id: <20200730174503.1392205-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06UHoNvs017469
X-loop: linux-cachefs@redhat.com
Cc: smfrench@gmail.com, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH v2] fscache: disable cookie when doing an
	invalidation for DIO write
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

O_DIRECT I/O is probably a good indicator that we don't need to be
caching this file at the moment. Disable the cookie by treating it
as we would a NULL cookie after the invalidation completes. Reenable
when the last unuse is done.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/fscache/cookie.c     |  8 +++++++-
 include/linux/fscache.h | 15 +++++++++------
 2 files changed, 16 insertions(+), 7 deletions(-)

v2: don't invalidate if DISABLED bit is already set

diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index d01d92fbb8d2..c47306589739 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -427,8 +427,10 @@ void __fscache_unuse_cookie(struct fscache_cookie *cookie,
 {
 	if (aux_data || object_size)
 		__fscache_update_cookie(cookie, aux_data, object_size);
-	if (atomic_dec_and_test(&cookie->n_active))
+	if (atomic_dec_and_test(&cookie->n_active)) {
+		clear_bit(FSCACHE_COOKIE_DISABLED, &cookie->flags);
 		wake_up_var(&cookie->n_active);
+	}
 }
 EXPORT_SYMBOL(__fscache_unuse_cookie);
 
@@ -550,6 +552,10 @@ void __fscache_invalidate(struct fscache_cookie *cookie,
 	 */
 	ASSERTCMP(cookie->type, !=, FSCACHE_COOKIE_TYPE_INDEX);
 
+	if ((flags & FSCACHE_INVAL_DIO_WRITE) &&
+	    test_and_set_bit(FSCACHE_COOKIE_DISABLED, &cookie->flags))
+		return;
+
 	spin_lock(&cookie->lock);
 	fscache_update_aux(cookie, aux_data, &new_size);
 	cookie->zero_point = new_size;
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index a9c296a23812..2aa7df585b25 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -23,9 +23,11 @@
 #if defined(CONFIG_FSCACHE) || defined(CONFIG_FSCACHE_MODULE)
 #define fscache_available() (1)
 #define fscache_cookie_valid(cookie) (cookie)
+#define fscache_cookie_enabled(cookie) (cookie && !test_bit(FSCACHE_COOKIE_DISABLED, &cookie->flags))
 #else
 #define fscache_available() (0)
 #define fscache_cookie_valid(cookie) (0)
+#define fscache_cookie_enabled(cookie) (0)
 #endif
 
 
@@ -113,6 +115,7 @@ struct fscache_cookie {
 
 	unsigned long			flags;
 #define FSCACHE_COOKIE_RELINQUISHED	6		/* T if cookie has been relinquished */
+#define FSCACHE_COOKIE_DISABLED		7		/* T if cookie has been disabled */
 
 	enum fscache_cookie_stage	stage;
 	enum fscache_cookie_type	type:8;
@@ -434,7 +437,7 @@ static inline
 void fscache_update_cookie(struct fscache_cookie *cookie, const void *aux_data,
 			   const loff_t *object_size)
 {
-	if (fscache_cookie_valid(cookie))
+	if (fscache_cookie_enabled(cookie))
 		__fscache_update_cookie(cookie, aux_data, object_size);
 }
 
@@ -451,7 +454,7 @@ void fscache_update_cookie(struct fscache_cookie *cookie, const void *aux_data,
 static inline
 void fscache_resize_cookie(struct fscache_cookie *cookie, loff_t new_size)
 {
-	if (fscache_cookie_valid(cookie))
+	if (fscache_cookie_enabled(cookie))
 		__fscache_resize_cookie(cookie, new_size);
 }
 
@@ -509,7 +512,7 @@ static inline
 void fscache_invalidate(struct fscache_cookie *cookie,
 			const void *aux_data, loff_t size, unsigned int flags)
 {
-	if (fscache_cookie_valid(cookie))
+	if (fscache_cookie_enabled(cookie))
 		__fscache_invalidate(cookie, aux_data, size, flags);
 }
 
@@ -568,7 +571,7 @@ void fscache_shape_request(struct fscache_cookie *cookie,
 	shape->actual_nr_pages	= shape->proposed_nr_pages;
 	shape->actual_start	= shape->proposed_start;
 
-	if (fscache_cookie_valid(cookie))
+	if (fscache_cookie_enabled(cookie))
 		__fscache_shape_request(cookie, shape);
 	else if (((loff_t)shape->proposed_start << PAGE_SHIFT) >= shape->i_size)
 		shape->to_be_done = FSCACHE_FILL_WITH_ZERO;
@@ -599,7 +602,7 @@ void fscache_shape_request(struct fscache_cookie *cookie,
 static inline
 int fscache_read(struct fscache_io_request *req, struct iov_iter *iter)
 {
-	if (fscache_cookie_valid(req->cookie))
+	if (fscache_cookie_enabled(req->cookie))
 		return __fscache_read(req, iter);
 	req->error = -ENODATA;
 	if (req->io_done)
@@ -633,7 +636,7 @@ int fscache_read(struct fscache_io_request *req, struct iov_iter *iter)
 static inline
 int fscache_write(struct fscache_io_request *req, struct iov_iter *iter)
 {
-	if (fscache_cookie_valid(req->cookie))
+	if (fscache_cookie_enabled(req->cookie))
 		return __fscache_write(req, iter);
 	req->error = -ENOBUFS;
 	if (req->io_done)
-- 
2.26.2


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

