Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0CB4F1012
	for <lists+linux-cachefs@lfdr.de>; Mon,  4 Apr 2022 09:40:44 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-iyFR2DjNPQ-A6OgAOecz3w-1; Mon, 04 Apr 2022 03:40:42 -0400
X-MC-Unique: iyFR2DjNPQ-A6OgAOecz3w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F00CC185A79C;
	Mon,  4 Apr 2022 07:40:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8870914A4F88;
	Mon,  4 Apr 2022 07:40:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B21A01940367;
	Mon,  4 Apr 2022 07:40:39 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 27F7E1947BBE for <linux-cachefs@listman.corp.redhat.com>;
 Sat,  2 Apr 2022 04:47:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 03072558F09; Sat,  2 Apr 2022 04:47:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F3501558F08
 for <linux-cachefs@redhat.com>; Sat,  2 Apr 2022 04:47:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B3ED3804508
 for <linux-cachefs@redhat.com>; Sat,  2 Apr 2022 04:47:48 +0000 (UTC)
Received: from u04.bc.larksuite.com (u04.bc.larksuite.com [130.44.212.43])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-4oAnh_moOue8lN7CoMoqpw-3; Sat, 02 Apr 2022 00:47:44 -0400
X-MC-Unique: 4oAnh_moOue8lN7CoMoqpw-3
Date: Sat, 02 Apr 2022 12:47:43 +0800
To: <dhowells@redhat.com>, <linux-cachefs@redhat.com>
From: "Yue Hu" <huyue2@coolpad.com>
Message-Id: <20220402044728.9669-1-huyue2@coolpad.com>
Mime-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mailman-Approved-At: Mon, 04 Apr 2022 07:40:39 +0000
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: [Linux-cachefs] [PATCH] fscache: Move fscache_cookies_seq_ops
 specific code under CONFIG_PROC_FS
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
Cc: Yue Hu <huyue2@coolpad.com>, linux-kernel@vger.kernel.org, zbestahu@163.com,
 zbestahu@gmail.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

fscache_cookies_seq_ops is only used in proc.c that is compiled under
enabled CONFIG_PROC_FS, so move related code under this config. The
same case exsits in internal.h.

Also, make fscache_lru_cookie_timeout static due to no user outside
of cookie.c.

Signed-off-by: Yue Hu <huyue2@coolpad.com>
---
 fs/fscache/cookie.c   | 4 +++-
 fs/fscache/internal.h | 4 ++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index 9bb1ab5fe5ed..9d3cf0111709 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -30,7 +30,7 @@ static DEFINE_SPINLOCK(fscache_cookie_lru_lock);
 DEFINE_TIMER(fscache_cookie_lru_timer, fscache_cookie_lru_timed_out);
 static DECLARE_WORK(fscache_cookie_lru_work, fscache_cookie_lru_worker);
 static const char fscache_cookie_states[FSCACHE_COOKIE_STATE__NR] = "-LCAIFUWRD";
-unsigned int fscache_lru_cookie_timeout = 10 * HZ;
+static unsigned int fscache_lru_cookie_timeout = 10 * HZ;
 
 void fscache_print_cookie(struct fscache_cookie *cookie, char prefix)
 {
@@ -1069,6 +1069,7 @@ void __fscache_invalidate(struct fscache_cookie *cookie,
 }
 EXPORT_SYMBOL(__fscache_invalidate);
 
+#ifdef CONFIG_PROC_FS
 /*
  * Generate a list of extant cookies in /proc/fs/fscache/cookies
  */
@@ -1145,3 +1146,4 @@ const struct seq_operations fscache_cookies_seq_ops = {
 	.stop   = fscache_cookies_seq_stop,
 	.show   = fscache_cookies_seq_show,
 };
+#endif
diff --git a/fs/fscache/internal.h b/fs/fscache/internal.h
index ed1c9ed737f2..1336f517e9b1 100644
--- a/fs/fscache/internal.h
+++ b/fs/fscache/internal.h
@@ -56,7 +56,9 @@ static inline bool fscache_set_cache_state_maybe(struct fscache_cache *cache,
  * cookie.c
  */
 extern struct kmem_cache *fscache_cookie_jar;
+#ifdef CONFIG_PROC_FS
 extern const struct seq_operations fscache_cookies_seq_ops;
+#endif
 extern struct timer_list fscache_cookie_lru_timer;
 
 extern void fscache_print_cookie(struct fscache_cookie *cookie, char prefix);
@@ -137,7 +139,9 @@ int fscache_stats_show(struct seq_file *m, void *v);
 /*
  * volume.c
  */
+#ifdef CONFIG_PROC_FS
 extern const struct seq_operations fscache_volumes_seq_ops;
+#endif
 
 struct fscache_volume *fscache_get_volume(struct fscache_volume *volume,
 					  enum fscache_volume_trace where);
-- 
2.17.1
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

