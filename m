Return-Path: <linux-cachefs+bncBDLIXLMFVAERBTHZSCWAMGQE5JVQPXA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com [209.85.219.199])
	by mail.lfdr.de (Postfix) with ESMTPS id 664B081B76C
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:25:33 +0100 (CET)
Received: by mail-yb1-f199.google.com with SMTP id 3f1490d57ef6-dbdaff78655sf891300276.1
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:25:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165132; cv=pass;
        d=google.com; s=arc-20160816;
        b=ngQ4QDfHKUAZn1xJrjjt/tu6UxBt99JZeKyY9BqKcXoBw/ScGT2MEoxTDo/gwBoOro
         ZmRs6mLuH6oW9vrbo2VWTnlCU6XsW7BA/7863BSwFs9bsJDkkWT1HwO/33o4AVF35xlH
         /jV2dq71VoJiaRm5kspa8xxixj2UAEpyRMwlFONIqCupJ5t7rH3yMa2hT1kig7jYVPhZ
         23TQ5931dZQ3KeRQ5xDZzfnHM64TxLLiGJHF1DAJSWgZwzwQ9BDjmen7U4YrI8IejUQB
         IWUsbhW/B5mjRcvkfUOMmxHDITeMRPj0OwaIgI9SqSuHG8HzEAdSknw9LZG8la581kqs
         Ya8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=tUNA23y1X6IBfELoFRIOyNR8cypBLOx4k2FBk7bb4II=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=VcMkzT5FKaBB+JLhmLgTVrJx5mdb/UnAe+/Ev8z0oaCk0xUdjuEBRwU0GbEzYv2vxa
         PRTOAiT750UA7EZpSo0p6VQDv/YGhALeAwsGaLR3AXPR1twaUV5EageruNkBCtpekcRr
         eVUcskkVXjC18ITmMP1ZGBd0yeevB5tcJXQdGB+3DQBz5K8Z34HMf5QlN7CO29lL/YzN
         6Ramkw14hq8IVFuX05ds9SSvFhkAqWOn+SpuC5KbwqTXfsBcTjsDuOq2C65I8XWr9NPb
         iYQhl9v2zXObIiUGWKTEuzjL7oLRAW+sSIBYOnT0mod4VdtKq8/79eEqXnzFYoOgFHTo
         srSQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165132; x=1703769932;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUNA23y1X6IBfELoFRIOyNR8cypBLOx4k2FBk7bb4II=;
        b=rBQYXpW3RlQaTtsltfuD8ZFKefyWinIXpDNQ31zFsVCeXiF5P3hX3Wmvl5WnZfiZFi
         kubUc3SUQCBhDBfpiL/X25kg5qB9jLFos0FX5wm9Se0WyM1QiNnd8cK73KKVLs1m9I5O
         7CPXGj/HP+WyQ2wzsd4IPUr7YtTRok6wO6i+sjp+ogS+Db3iIBzMrIEm+qmHm7+qMrXg
         yNr5l3RxVh73i14l3wrYZ4FxZTE6sHS5kt/u4XnNfe8dcBIKtTHt+c1qr6LEfnpt1Cqd
         Lifatz3Op/VAYu9rVGYXDAdbIhKAemr36R/O74oXuj9Qf05l1yEsRsnSqoEWXHoWJbMj
         bXMg==
X-Gm-Message-State: AOJu0YzOdq1I7ahJyrS3NPawt2XevYdRrKdnaxT/u/Xi7kYozQ+hQlEw
	yp4SONnQWwM6+nOHtlUrwvTRqA==
X-Google-Smtp-Source: AGHT+IGfscfslV6lHqIOFvV9oFYfhI4c3WqYMzS5VadCVV9o7cCPpY+RL8gkdoONyjEluqKoKGGAxQ==
X-Received: by 2002:a25:ae60:0:b0:dbd:75e6:5f3b with SMTP id g32-20020a25ae60000000b00dbd75e65f3bmr940944ybe.100.1703165132208;
        Thu, 21 Dec 2023 05:25:32 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:e087:0:b0:dbd:97bc:c37f with SMTP id x129-20020a25e087000000b00dbd97bcc37fls1111272ybg.0.-pod-prod-02-us;
 Thu, 21 Dec 2023 05:25:31 -0800 (PST)
X-Received: by 2002:a25:690b:0:b0:dbd:ab70:4e8f with SMTP id e11-20020a25690b000000b00dbdab704e8fmr1041107ybc.4.1703165131580;
        Thu, 21 Dec 2023 05:25:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165131; cv=none;
        d=google.com; s=arc-20160816;
        b=wmnnfOs2JIlHlvk2e6K4UQao86Y2XkYNcPqY90/I3K+1l186WM7kuvm2wCnQEib7QZ
         waCQ9x0TON17ebttow4TehNrcsQvoLqR7afcQdE2M0VEgq2Rx14/wRDyRTCcqs/2ibtN
         F/X/+QFWHVzr5R14GtZepZS32mE0u5p/tKQIReZoW67y8mGXy2ZaeFiPJEL6RcX/p6AV
         og45mfGSeppqhJKGl6lyjRIP0e30LVv+ERL6g5qvSaPdparhSKgV16u60FAyxP5QR5IG
         XBOfM71ER2MUidnEB+fq7RRsUK0qCcXvN7Oc7OW5IUKOzRQQ7hBkLKE4tZ6b59BFXKbj
         Pngg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=/poDr8aeuvYsVSyxBxV9eTNahVNZ3naX9lqBidu9TAg=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=awY3UK3sqhGy/dSIW3PgAWMeR7wIdkWQXaYFNxzY04jHqY/TkegFJdD8xI1zRDQWS9
         5shG5swjx+RFHOL48CRyskUs64wNwUk6te4q+9vZTsu2sijuU0zCY3+1XJ9nfLTgezkw
         X36t2cL476TGZrHP4HK0UJLrs19SFKx5FoIJekRrAY29Sbt75fciv/3+7VkytXesnLaT
         ra7ReRHN1T3u0hqNdYm/FaXYyicsseReTg80pYmZ2acIq22FDIEtvG89Z60xMDbUNclO
         Ls8B+WDbGNCU2m/6ns79HCBwaiTdsNT6opkFAIJbwVGWrTq2zAm1LezLwbJmBzHeP3bJ
         lS6w==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id y18-20020a0ce052000000b0067f896003ffsi621957qvk.218.2023.12.21.05.25.31
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:25:31 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-YrlIc5CgPF-ZVkibMszUlQ-1; Thu, 21 Dec 2023 08:25:30 -0500
X-MC-Unique: YrlIc5CgPF-ZVkibMszUlQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3059868A02
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:25:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id DF48FC159B0; Thu, 21 Dec 2023 13:25:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 00987C15968;
	Thu, 21 Dec 2023 13:25:26 +0000 (UTC)
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
Subject: [PATCH v5 22/40] netfs: Make the refcounting of netfs_begin_read() easier to use
Date: Thu, 21 Dec 2023 13:23:17 +0000
Message-ID: <20231221132400.1601991-23-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
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
Reviewed-by: Jeff Layton <jlayton@kernel.org>
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
index e228bfb530ea..e83ef5835d25 100644
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
 
@@ -665,12 +665,10 @@ int netfs_begin_read(struct netfs_io_request *rreq, bool sync)
 
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
@@ -680,25 +678,25 @@ int netfs_begin_read(struct netfs_io_request *rreq, bool sync)
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

