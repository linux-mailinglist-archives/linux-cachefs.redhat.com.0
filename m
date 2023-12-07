Return-Path: <linux-cachefs+bncBDLIXLMFVAERBVHPZCVQMGQEAHJT5KI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BA5809366
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:23:33 +0100 (CET)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-58e157f489dsf1487918eaf.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:23:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984212; cv=pass;
        d=google.com; s=arc-20160816;
        b=kfq7S86LsampSc5HuEFjvMqbWC8U6QBST9nUrh7wd9rryexv6ZdNxyqGzyZfCmJdBQ
         omAycm5EpgL3GyDgPaCWgiaOO7mNLaAjj2vTPVF1VVsHt9RdayhxUJz2D77ZPia9Nrom
         M11xDtaTh8X84jd/PyDqybH1awkDhCf+EB+WbboQQP5ikbNX0yhrx5KJxh9/GeQdMMCZ
         HpNSugXJdtUumwo2yNQ3sZXsp34EZsz1TyLXBmub3BQYvIxR8W62g3ZKEuqfPekR0kZh
         hnfyiGOiSPPqWXKJoNeux2wTWF/miTI0313RtoLn/0xDds0p+/Q6eSGJONsetx0ecMMC
         zgLA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=Z2x+hpdK7Ih09BWNQFa76B/SQ+Z0eAwdc9bKVryAuLw=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=C6agTkCk+m2mkzkIGY8ULmcnm/X9EdRmj1z0/WpzwhlnrrwiPrAsvqGYNgz2q5muhj
         MlLUYA3H6iVhXogGKhr2KLkS7yO6ypyJxZJbhCB5x9M34q6hDbkb9juq+aBu8kJoIzNB
         NDFC+D2NPE/K2CcX7R3gkh2w2LQ4LFB6seOg8t6RRut94AHzpLqSPfupisE4lOJmanW+
         HVtzw1EYOhjEigncnvLQdoRv5PVBcyqOT+QRmRpUnZ/KqlaO/9BzWCrgps4P284oiQ3R
         1TgAkan5/eElapXZwMfAIKKrHYmEj65x36k2Un72Zxa4hzV9sdfFbUyiHWx1NtubzdfY
         0b6w==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984212; x=1702589012;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2x+hpdK7Ih09BWNQFa76B/SQ+Z0eAwdc9bKVryAuLw=;
        b=Cz6KG3eJB8RLJIcysuOazAxvcUCQeGGCiPvrNbhDSb31nOqLoE9+fNT/pmF9exnZ5Q
         mrlmZEfZe0lC0Lvx7/Ij+j9GmsO6Zak/WT6gX1ZoH4TXs2DB6yw04BoV8xfk1fIboICc
         +G3Up8y1gDoLCHadLl941MRGG27HIWeS3X5uNcmloIma1QaJ25juAmgllXuF4n7XuX+5
         EzYs1Z70Vvdd6uTd6ZTAGPaNbd7/urwcG4Xsb0/sFGLaUpivTNwAH/30EOc/FTmuVAwp
         5zjzbwjl4BulSraqHMWipLVhCMA0T7RNfNbHbNYwU+S9d/W8GAhA5nkKhfKM6Se8ic6V
         YDPw==
X-Gm-Message-State: AOJu0YxKWxW4LXXyop0qUkm3NnjFjXmsBCf+mbPp70iC4OGN/CNemh6z
	6ANYG7U/nu2Ehme34z3LJYyhCg==
X-Google-Smtp-Source: AGHT+IGbyO+Jyv+y2bgLLyyH6HoFV0cH4Nx8bMqssSTkv4V3HamaXylkS8mkhDSMBhf9tizl2cBFLg==
X-Received: by 2002:a05:6820:1ac4:b0:58d:ca8b:7a83 with SMTP id bu4-20020a0568201ac400b0058dca8b7a83mr3282408oob.5.1701984212538;
        Thu, 07 Dec 2023 13:23:32 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6820:2224:b0:58e:2769:6234 with SMTP id
 cj36-20020a056820222400b0058e27696234ls2380166oob.0.-pod-prod-09-us; Thu, 07
 Dec 2023 13:23:31 -0800 (PST)
X-Received: by 2002:a05:6358:e4a8:b0:16f:ec86:698a with SMTP id by40-20020a056358e4a800b0016fec86698amr4637968rwb.9.1701984211762;
        Thu, 07 Dec 2023 13:23:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984211; cv=none;
        d=google.com; s=arc-20160816;
        b=SCg9rQ6YyWa99Qu1lzEMFeHzWEgM8DWknW6gw/Yvn0HfmwnnT88CCyzVcJV4UeYcyG
         6rmLSCb02Xjev9r0w4uPlASjzkdsaUAScPUAyD0G1tqAFNpgS4616Cs0XomDhJTCPMi3
         imTyNirRh7/HhOVVdGpJuhlEFWyG63TalBPBUcYWTwPsqfnJnDiYN9iLfv0Hjmwd/gSq
         OiHovNrxRs6cijYZXVlvTUZbYQMoTVaZ80KoGMBsYxDJOy34/Z9tME1sDu4fkQkk31cC
         Zy75EfTAGbxvaehGX3/2FJ/ed3SygT6rvmDEVWGCK4elzDbVhTuzr0kAyBHWa4vWYJfJ
         zpvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=9CUqcQhkx342wCXCrXY79eb8GLJZvNRKMGt3t1k0yyQ=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=trJGl53TPfUnwb0FA/JRKqwxnrmPqMy3Kxanc0oYFjTbMRRLqqj7soesapoJPXHY0c
         M2siS2u4Ypr3LOXjcNGhPciqtjj06UJoFuGohJE8YpkooF5NQA6K+lbquaFz/XEpPUVl
         uM9Bl2ykVEoyYiJhmJYmIhGG70TAQq95ImFTuKZNa/yH7BklIcDIVTsoZspIqq/i1Jxv
         bwo3gSqIe9bSAjRz7gTGTgTautzmHUAgKUenPi0iwXgoT6pwj3ElZjxoEqJf5MqHUwZU
         /A/b0GLDSPLrgi6Ip1BmHi5QPb2EYl5I+fYdEQdRWMJBhCeCLkrP1jMLZTLprTqNobeN
         BYlw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id v16-20020ad45290000000b0067ab6b17cedsi655956qvr.7.2023.12.07.13.23.31
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:23:31 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-cQUsy1s6P4GGo3serhVJ2Q-1; Thu, 07 Dec 2023 16:23:28 -0500
X-MC-Unique: cQUsy1s6P4GGo3serhVJ2Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA82A85CBA5
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:23:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id B7CDF492BC6; Thu,  7 Dec 2023 21:23:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 229FF492BCE;
	Thu,  7 Dec 2023 21:23:25 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	Christian Brauner <christian@brauner.io>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 22/59] netfs: Make the refcounting of netfs_begin_read() easier to use
Date: Thu,  7 Dec 2023 21:21:29 +0000
Message-ID: <20231207212206.1379128-23-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

Make the refcounting of netfs_begin_read() easier to use by not eating the
caller's ref on the netfs_io_request it's given.  This makes it easier to
use when we need to look in the request struct after.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/buffered_read.c     |  6 +++++-
 fs/netfs/io.c                | 28 +++++++++++++---------------
 include/trace/events/netfs.h |  9 +++++----
 3 files changed, 23 insertions(+), 20 deletions(-)

diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 751556faa70b..6b9a44cafbac 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -210,6 +210,7 @@ void netfs_readahead(struct readahead_control *ractl)
 		;
 
 	netfs_begin_read(rreq, false);
+	netfs_put_request(rreq, false, netfs_rreq_trace_put_return);
 	return;
 
 cleanup_free:
@@ -260,7 +261,9 @@ int netfs_read_folio(struct file *file, struct folio *folio)
 	iov_iter_xarray(&rreq->iter, ITER_DEST, &mapping->i_pages,
 			rreq->start, rreq->len);
 
-	return netfs_begin_read(rreq, true);
+	ret = netfs_begin_read(rreq, true);
+	netfs_put_request(rreq, false, netfs_rreq_trace_put_return);
+	return ret;
 
 discard:
 	netfs_put_request(rreq, false, netfs_rreq_trace_put_discard);
@@ -429,6 +432,7 @@ int netfs_write_begin(struct netfs_inode *ctx,
 	ret = netfs_begin_read(rreq, true);
 	if (ret < 0)
 		goto error;
+	netfs_put_request(rreq, false, netfs_rreq_trace_put_return);
 
 have_folio:
 	ret = folio_wait_fscache_killable(folio);
diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index c80b8eed1209..1795f8679be9 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -362,6 +362,7 @@ static void netfs_rreq_assess(struct netfs_io_request *rreq, bool was_async)
 
 	netfs_rreq_unlock_folios(rreq);
 
+	trace_netfs_rreq(rreq, netfs_rreq_trace_wake_ip);
 	clear_bit_unlock(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
 	wake_up_bit(&rreq->flags, NETFS_RREQ_IN_PROGRESS);
 
@@ -657,7 +658,6 @@ int netfs_begin_read(struct netfs_io_request *rreq, bool sync)
 
 	if (rreq->len == 0) {
 		pr_err("Zero-sized read [R=%x]\n", rreq->debug_id);
-		netfs_put_request(rreq, false, netfs_rreq_trace_put_zero_len);
 		return -EIO;
 	}
 
@@ -669,12 +669,10 @@ int netfs_begin_read(struct netfs_io_request *rreq, bool sync)
 
 	INIT_WORK(&rreq->work, netfs_rreq_work);
 
-	if (sync)
-		netfs_get_request(rreq, netfs_rreq_trace_get_hold);
-
 	/* Chop the read into slices according to what the cache and the netfs
 	 * want and submit each one.
 	 */
+	netfs_get_request(rreq, netfs_rreq_trace_get_for_outstanding);
 	atomic_set(&rreq->nr_outstanding, 1);
 	io_iter = rreq->io_iter;
 	do {
@@ -684,25 +682,25 @@ int netfs_begin_read(struct netfs_io_request *rreq, bool sync)
 	} while (rreq->submitted < rreq->len);
 
 	if (sync) {
-		/* Keep nr_outstanding incremented so that the ref always belongs to
-		 * us, and the service code isn't punted off to a random thread pool to
-		 * process.
+		/* Keep nr_outstanding incremented so that the ref always
+		 * belongs to us, and the service code isn't punted off to a
+		 * random thread pool to process.  Note that this might start
+		 * further work, such as writing to the cache.
 		 */
-		for (;;) {
-			wait_var_event(&rreq->nr_outstanding,
-				       atomic_read(&rreq->nr_outstanding) == 1);
+		wait_var_event(&rreq->nr_outstanding,
+			       atomic_read(&rreq->nr_outstanding) == 1);
+		if (atomic_dec_and_test(&rreq->nr_outstanding))
 			netfs_rreq_assess(rreq, false);
-			if (!test_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags))
-				break;
-			cond_resched();
-		}
+
+		trace_netfs_rreq(rreq, netfs_rreq_trace_wait_ip);
+		wait_on_bit(&rreq->flags, NETFS_RREQ_IN_PROGRESS,
+			    TASK_UNINTERRUPTIBLE);
 
 		ret = rreq->error;
 		if (ret == 0 && rreq->submitted < rreq->len) {
 			trace_netfs_failure(rreq, NULL, ret, netfs_fail_short_read);
 			ret = -EIO;
 		}
-		netfs_put_request(rreq, false, netfs_rreq_trace_put_hold);
 	} else {
 		/* If we decrement nr_outstanding to 0, the ref belongs to us. */
 		if (atomic_dec_and_test(&rreq->nr_outstanding))
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index 4ea4e34d279f..6daadf2aac8a 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -34,7 +34,9 @@
 	EM(netfs_rreq_trace_free,		"FREE   ")	\
 	EM(netfs_rreq_trace_resubmit,		"RESUBMT")	\
 	EM(netfs_rreq_trace_unlock,		"UNLOCK ")	\
-	E_(netfs_rreq_trace_unmark,		"UNMARK ")
+	EM(netfs_rreq_trace_unmark,		"UNMARK ")	\
+	EM(netfs_rreq_trace_wait_ip,		"WAIT-IP")	\
+	E_(netfs_rreq_trace_wake_ip,		"WAKE-IP")
 
 #define netfs_sreq_sources					\
 	EM(NETFS_FILL_WITH_ZEROES,		"ZERO")		\
@@ -65,14 +67,13 @@
 	E_(netfs_fail_prepare_write,		"prep-write")
 
 #define netfs_rreq_ref_traces					\
-	EM(netfs_rreq_trace_get_hold,		"GET HOLD   ")	\
+	EM(netfs_rreq_trace_get_for_outstanding,"GET OUTSTND")	\
 	EM(netfs_rreq_trace_get_subreq,		"GET SUBREQ ")	\
 	EM(netfs_rreq_trace_put_complete,	"PUT COMPLT ")	\
 	EM(netfs_rreq_trace_put_discard,	"PUT DISCARD")	\
 	EM(netfs_rreq_trace_put_failed,		"PUT FAILED ")	\
-	EM(netfs_rreq_trace_put_hold,		"PUT HOLD   ")	\
+	EM(netfs_rreq_trace_put_return,		"PUT RETURN ")	\
 	EM(netfs_rreq_trace_put_subreq,		"PUT SUBREQ ")	\
-	EM(netfs_rreq_trace_put_zero_len,	"PUT ZEROLEN")	\
 	E_(netfs_rreq_trace_new,		"NEW        ")
 
 #define netfs_sreq_ref_traces					\

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

