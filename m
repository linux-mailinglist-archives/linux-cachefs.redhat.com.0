Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 408E14F9FE7
	for <lists+linux-cachefs@lfdr.de>; Sat,  9 Apr 2022 01:07:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649459222;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mE8+Xg0Qyd1lU5rPSp8850rvEb82UlV/gMDG7ThfPCE=;
	b=Kc6p5N+AbkTtCwIfCWjfew4GqhLqHng50yG4HZOuMTn6K/iH5H9Xy3GVa/CYG0vny/32kZ
	BhKA1sHlPUzK4sMS6ZIjJPJtETIqoG/W1INtYbn3WFfNorpmkWe2JJPlFtpIiB2I+me9Lh
	HvL7W4Hako1dpSm0uw9MV4GpW80mg/g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-ov0rAmY-PJOGhTvqlMr_MA-1; Fri, 08 Apr 2022 19:06:58 -0400
X-MC-Unique: ov0rAmY-PJOGhTvqlMr_MA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4940429DD981;
	Fri,  8 Apr 2022 23:06:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 400EE4047D21;
	Fri,  8 Apr 2022 23:06:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0E1D1194034B;
	Fri,  8 Apr 2022 23:06:58 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 121F61940341 for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  8 Apr 2022 23:06:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E84D0434844; Fri,  8 Apr 2022 23:06:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6B4E434832;
 Fri,  8 Apr 2022 23:06:55 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Sat, 09 Apr 2022 00:06:55 +0100
Message-ID: <164945921506.773423.5359381227919135073.stgit@warthog.procyon.org.uk>
In-Reply-To: <164945915630.773423.14655306154231712324.stgit@warthog.procyon.org.uk>
References: <164945915630.773423.14655306154231712324.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Linux-cachefs] [PATCH 6/8] fscache: Move fscache_cookies_seq_ops
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
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Yue Hu <huyue2@coolpad.com>,
 linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Yue Hu <huyue2@coolpad.com>

fscache_cookies_seq_ops is only used in proc.c that is compiled under
enabled CONFIG_PROC_FS, so move related code under this config. The
same case exsits in internal.h.

Also, make fscache_lru_cookie_timeout static due to no user outside
of cookie.c.

Signed-off-by: Yue Hu <huyue2@coolpad.com>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
Link: https://listman.redhat.com/archives/linux-cachefs/2022-April/006649.html # v1
---

 fs/fscache/cookie.c   |    4 +++-
 fs/fscache/internal.h |    4 ++++
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
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

