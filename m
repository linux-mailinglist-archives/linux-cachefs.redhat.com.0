Return-Path: <linux-cachefs+bncBDLIXLMFVAERBGWGVW4QMGQENFSOBVI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mail.lfdr.de (Postfix) with ESMTPS id 609B39BE9D2
	for <lists+linux-cachefs@lfdr.de>; Wed,  6 Nov 2024 13:37:48 +0100 (CET)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3e62ac54e9fsf6249657b6e.3
        for <lists+linux-cachefs@lfdr.de>; Wed, 06 Nov 2024 04:37:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1730896667; cv=pass;
        d=google.com; s=arc-20240605;
        b=k74LwA2YIuvQxIxODBYX44w4K9N++lDHL3hab0Hn/TVolcThbsUmT6RX8XsWW/rrQt
         OU1W2ovfubUyT5Wv7RJN+EyD1VGlU3kh61uUCmAtUk0ONzJzHoKDufTyyo+uhe/KvDSE
         vxgaT0drENoktH8ECkJw14LDH6HJKEFkiNVvsHh8nJqqEoOiJXti5z7TapZSIfaczxGH
         iHx7nwcWn4eP+DvX2BebmdBafDbnrHrAAjvObAR+3QukC6w9P8RJ75wm6yiDoNMnkDsq
         SVczrsfofA5rYiQ7yQDxKI/nyYle7Hr3uHGKHLWcEDtXQ+LgzUWCblvkHjOK+CKIOVT2
         he+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=D7fLZLjcvyo/Q3NNJcHUyMBXhE6DbF8MPpsasUup1dQ=;
        fh=4HUVkVPmfE7st8WbKMD4vQlHkrz6MgPJcLXWquxmNHQ=;
        b=I11rYZY0LGVOi1PUAwCHiyPxsz2AdonZ63lWBkldAr3K9n1HdwSOrzvi0jyvfMZuf2
         MTlHLF4YyMFz8PADfQXRLLM11gz7tNVkTVT+4quwmOg6xNl1/omLNfdw13m8Y46LpOCo
         6TRUJRy/N63jWUZ6WIQ2/8e7RtyIqWd/Xua18EVFtzigrUieptb/jkdz66/bItJ2Hs5h
         7Y3bMDdL8tNxi6HPFVWAG1qXDyg1cW4odTmNC40wY/vn4vLxDF/pgAeV8NuNF2GA3oez
         xNYoklRV4RPpeTwjIcixU+KqtVFTjc4oW0tf8mv2dRhlDLbXXFlRuJwqiJxML6sp4kTi
         Mvvg==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730896667; x=1731501467;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7fLZLjcvyo/Q3NNJcHUyMBXhE6DbF8MPpsasUup1dQ=;
        b=CKQaCQsWnjVRt3ZhbGeOQBHJGQzKqFgQqfP/3qZVf8bok4S+lhYcrW7glL7yUDSHh2
         0flabkKjcu82dswkuXKeoLZfUNycZAFRJgMfwGE2XNfEcIvSZHGfMau9ym0HlxvuwJhV
         adag/CgihokRNgFoUKJjJrdwKvTZsYzu9gLmQqzcgsknTYFUomFirIHduX/p3vkMvwb2
         hc8lZYUJyPannLkXjpr82jroJq66JCjClsTgR5Fpajbn1Y7RbLbiIbxof1CUQDJQlh4P
         DmuiV4T+M30Cx5I8vc2oM/HkgxGjUMGy9N3R0fyxVFqvaorbPb4YoRwcr0yP/Ek/9Fg5
         8Beg==
X-Forwarded-Encrypted: i=2; AJvYcCV7YshWUxh00XDkkgXCAAeQN55qL5iNLbn+bAHQj1QjGNXd4NHhRtBqck6t4m9+ljOD93+USA==@lfdr.de
X-Gm-Message-State: AOJu0YyaVkHHICDSt4Bzi9+CchmnXdETVxZWuNmnsa9JdZ/oSAukcjB3
	0rQJTqLEu9t5xfCR7tBt5VVt4VzV+/0xoir3zI3ZJpXfNs8P6M0i3899WSPFHvE=
X-Google-Smtp-Source: AGHT+IGYKRzaUhvRQ8JZ8nhVj66bO1r/yqg7RLts14D7eqyj/PhUh42dBCrhBlG6MVS6yFOfUhcTAg==
X-Received: by 2002:a05:6358:e9c5:b0:1c6:204b:c5a7 with SMTP id e5c5f4694b2df-1c6204bc5fcmr324379155d.10.1730896666797;
        Wed, 06 Nov 2024 04:37:46 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:2022:b0:6cb:2dc5:6bb5 with SMTP id
 6a1803df08f44-6d351b0f31els45887356d6.2.-pod-prod-02-us; Wed, 06 Nov 2024
 04:37:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXgp+Iv2oig1Pt4xYOdMcEWkAUoh9dB7DdhTzlDhuXebY6Qc7kDajb/5NzOq1SCtROPgJDxQsqoWDx3IMRi@gapps.redhat.com
X-Received: by 2002:a05:620a:4453:b0:7b1:b25d:2411 with SMTP id af79cd13be357-7b2f24c54admr2753968085a.6.1730896666105;
        Wed, 06 Nov 2024 04:37:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730896666; cv=none;
        d=google.com; s=arc-20240605;
        b=hgDNJHr5SnYCDD6VTKEH+CsllcEvHpG1gZ9+HixvLxzCSaUxp9xN356cVjAHD8HWml
         8Yg2w44t3COMYPMxfADx+N8TYHgAtVvXe6y0BakAQ174nHGGKp4uz21MwEpw3C8ZUv0o
         XUR3e3UC1RNk9HBCdosq0s13ZgKsCgMSKguDnKeSiJwX8oDHyokYIBaUsaWsc/oNRVFo
         gRMFtReV1uOPZXPWDxk8MSx41ZYgcmO/W4V0In3CE9vtFX66BiTYLIVwWXg9UZakHBx7
         u7X7du+LXf29RZa0DsYgMXsKJxs6sQvsPjGjFtNZm16aUuMCdYuIlSEq6uq1bggiyslf
         941A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=Gu5E8tyC96H9fpVehZhchYQCXTYRja375CBx48Z0WNk=;
        fh=S9oLL764npqAlTwfYdPhiOTkO7VjwvYShFF/IFwF3l8=;
        b=CBxO8gCOKNfvKFTd9OcIHZOylXLMmEBuT4OsiKu+iKWOdDkNRnAuAPA53aIBq+YVAt
         yxRxtJ/FuCz+SgZYVy09IpZuq2YXjVPt1rBlgaymW7QTJ+tI1CW8kRSEHH4tDrkJF6Fn
         FZNXVXm9iJMJ9Gw8UpvOCGfg3jn8opKW+zisWJNpRd4dWYmqwiqI1GjLy1L479BXdUcY
         ysBvdt0lQnBalZ3EdXJIuDELcuy9ge4+YchGi9lex7gVPGUyWgoa54Z/E4a+eca6sFhM
         TPzTISO4y7pfXWyLcbtxKRL/r8BcmWGeEM95olVaQzIASb7eOOwOTbSkbqEKSQFUqx+R
         J4hA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f3a839d6si1579057685a.372.2024.11.06.04.37.45
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 04:37:46 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-532-8OyOqDZuPLuncYa-q1qqEA-1; Wed,
 06 Nov 2024 07:37:44 -0500
X-MC-Unique: 8OyOqDZuPLuncYa-q1qqEA-1
X-Mimecast-MFC-AGG-ID: 8OyOqDZuPLuncYa-q1qqEA
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ADB001955D4D
	for <linux-cachefs@gapps.redhat.com>; Wed,  6 Nov 2024 12:37:43 +0000 (UTC)
Received: by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix)
	id A7CA519541A6; Wed,  6 Nov 2024 12:37:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk.com (unknown [10.42.28.231])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7463B19541A5;
	Wed,  6 Nov 2024 12:37:37 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Steve French <smfrench@gmail.com>,
	Matthew Wilcox <willy@infradead.org>
Cc: David Howells <dhowells@redhat.com>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	netfs@lists.linux.dev,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-cachefs@redhat.com
Subject: [PATCH v3 12/33] netfs: Don't use bh spinlock
Date: Wed,  6 Nov 2024 12:35:36 +0000
Message-ID: <20241106123559.724888-13-dhowells@redhat.com>
In-Reply-To: <20241106123559.724888-1-dhowells@redhat.com>
References: <20241106123559.724888-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lXUyCLcU9dJXz8d8tc15LtHrSMkEJrh7tbDw7_u7Y5o_1730896663
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

All the accessing of the subrequest lists is now done in process context,
possibly in a workqueue, but not now in a BH context, so we don't need the
lock against BH interference when taking the netfs_io_request::lock
spinlock.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/buffered_read.c |  4 ++--
 fs/netfs/direct_read.c   |  4 ++--
 fs/netfs/read_collect.c  | 20 ++++++++++----------
 fs/netfs/read_retry.c    |  8 ++++----
 fs/netfs/write_collect.c |  4 ++--
 fs/netfs/write_issue.c   |  4 ++--
 6 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 6fd4f3bef3b4..4a48b79b8807 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -200,12 +200,12 @@ static void netfs_read_to_pagecache(struct netfs_io_request *rreq)
 		subreq->len	= size;
 
 		atomic_inc(&rreq->nr_outstanding);
-		spin_lock_bh(&rreq->lock);
+		spin_lock(&rreq->lock);
 		list_add_tail(&subreq->rreq_link, &rreq->subrequests);
 		subreq->prev_donated = rreq->prev_donated;
 		rreq->prev_donated = 0;
 		trace_netfs_sreq(subreq, netfs_sreq_trace_added);
-		spin_unlock_bh(&rreq->lock);
+		spin_unlock(&rreq->lock);
 
 		source = netfs_cache_prepare_read(rreq, subreq, rreq->i_size);
 		subreq->source = source;
diff --git a/fs/netfs/direct_read.c b/fs/netfs/direct_read.c
index 54027fd14904..1a20cc3979c7 100644
--- a/fs/netfs/direct_read.c
+++ b/fs/netfs/direct_read.c
@@ -68,12 +68,12 @@ static int netfs_dispatch_unbuffered_reads(struct netfs_io_request *rreq)
 		subreq->len	= size;
 
 		atomic_inc(&rreq->nr_outstanding);
-		spin_lock_bh(&rreq->lock);
+		spin_lock(&rreq->lock);
 		list_add_tail(&subreq->rreq_link, &rreq->subrequests);
 		subreq->prev_donated = rreq->prev_donated;
 		rreq->prev_donated = 0;
 		trace_netfs_sreq(subreq, netfs_sreq_trace_added);
-		spin_unlock_bh(&rreq->lock);
+		spin_unlock(&rreq->lock);
 
 		netfs_stat(&netfs_n_rh_download);
 		if (rreq->netfs_ops->prepare_read) {
diff --git a/fs/netfs/read_collect.c b/fs/netfs/read_collect.c
index 146abb2e399a..53ef7e0f3e9c 100644
--- a/fs/netfs/read_collect.c
+++ b/fs/netfs/read_collect.c
@@ -142,7 +142,7 @@ static bool netfs_consume_read_data(struct netfs_io_subrequest *subreq)
 	prev_donated = READ_ONCE(subreq->prev_donated);
 	next_donated =  READ_ONCE(subreq->next_donated);
 	if (prev_donated || next_donated) {
-		spin_lock_bh(&rreq->lock);
+		spin_lock(&rreq->lock);
 		prev_donated = subreq->prev_donated;
 		next_donated =  subreq->next_donated;
 		subreq->start -= prev_donated;
@@ -155,7 +155,7 @@ static bool netfs_consume_read_data(struct netfs_io_subrequest *subreq)
 			next_donated = subreq->next_donated = 0;
 		}
 		trace_netfs_sreq(subreq, netfs_sreq_trace_add_donations);
-		spin_unlock_bh(&rreq->lock);
+		spin_unlock(&rreq->lock);
 	}
 
 	avail = subreq->transferred;
@@ -184,18 +184,18 @@ static bool netfs_consume_read_data(struct netfs_io_subrequest *subreq)
 		} else if (fpos < start) {
 			excess = fend - subreq->start;
 
-			spin_lock_bh(&rreq->lock);
+			spin_lock(&rreq->lock);
 			/* If we complete first on a folio split with the
 			 * preceding subreq, donate to that subreq - otherwise
 			 * we get the responsibility.
 			 */
 			if (subreq->prev_donated != prev_donated) {
-				spin_unlock_bh(&rreq->lock);
+				spin_unlock(&rreq->lock);
 				goto donation_changed;
 			}
 
 			if (list_is_first(&subreq->rreq_link, &rreq->subrequests)) {
-				spin_unlock_bh(&rreq->lock);
+				spin_unlock(&rreq->lock);
 				pr_err("Can't donate prior to front\n");
 				goto bad;
 			}
@@ -211,7 +211,7 @@ static bool netfs_consume_read_data(struct netfs_io_subrequest *subreq)
 
 			if (subreq->consumed >= subreq->len)
 				goto remove_subreq_locked;
-			spin_unlock_bh(&rreq->lock);
+			spin_unlock(&rreq->lock);
 		} else {
 			pr_err("fpos > start\n");
 			goto bad;
@@ -239,11 +239,11 @@ static bool netfs_consume_read_data(struct netfs_io_subrequest *subreq)
 	/* Donate the remaining downloaded data to one of the neighbouring
 	 * subrequests.  Note that we may race with them doing the same thing.
 	 */
-	spin_lock_bh(&rreq->lock);
+	spin_lock(&rreq->lock);
 
 	if (subreq->prev_donated != prev_donated ||
 	    subreq->next_donated != next_donated) {
-		spin_unlock_bh(&rreq->lock);
+		spin_unlock(&rreq->lock);
 		cond_resched();
 		goto donation_changed;
 	}
@@ -293,11 +293,11 @@ static bool netfs_consume_read_data(struct netfs_io_subrequest *subreq)
 	goto remove_subreq_locked;
 
 remove_subreq:
-	spin_lock_bh(&rreq->lock);
+	spin_lock(&rreq->lock);
 remove_subreq_locked:
 	subreq->consumed = subreq->len;
 	list_del(&subreq->rreq_link);
-	spin_unlock_bh(&rreq->lock);
+	spin_unlock(&rreq->lock);
 	netfs_put_subrequest(subreq, false, netfs_sreq_trace_put_consumed);
 	return true;
 
diff --git a/fs/netfs/read_retry.c b/fs/netfs/read_retry.c
index d1986cec3db7..264f3cb6a7dc 100644
--- a/fs/netfs/read_retry.c
+++ b/fs/netfs/read_retry.c
@@ -139,12 +139,12 @@ static void netfs_retry_read_subrequests(struct netfs_io_request *rreq)
 			__clear_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags);
 			__set_bit(NETFS_SREQ_RETRYING, &subreq->flags);
 
-			spin_lock_bh(&rreq->lock);
+			spin_lock(&rreq->lock);
 			list_add_tail(&subreq->rreq_link, &rreq->subrequests);
 			subreq->prev_donated += rreq->prev_donated;
 			rreq->prev_donated = 0;
 			trace_netfs_sreq(subreq, netfs_sreq_trace_retry);
-			spin_unlock_bh(&rreq->lock);
+			spin_unlock(&rreq->lock);
 
 			BUG_ON(!len);
 
@@ -215,9 +215,9 @@ static void netfs_retry_read_subrequests(struct netfs_io_request *rreq)
 		__clear_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags);
 		__clear_bit(NETFS_SREQ_RETRYING, &subreq->flags);
 	}
-	spin_lock_bh(&rreq->lock);
+	spin_lock(&rreq->lock);
 	list_splice_tail_init(&queue, &rreq->subrequests);
-	spin_unlock_bh(&rreq->lock);
+	spin_unlock(&rreq->lock);
 }
 
 /*
diff --git a/fs/netfs/write_collect.c b/fs/netfs/write_collect.c
index 85e8e94da90a..d291b31dd074 100644
--- a/fs/netfs/write_collect.c
+++ b/fs/netfs/write_collect.c
@@ -238,14 +238,14 @@ static void netfs_collect_write_results(struct netfs_io_request *wreq)
 
 		cancel:
 			/* Remove if completely consumed. */
-			spin_lock_bh(&wreq->lock);
+			spin_lock(&wreq->lock);
 
 			remove = front;
 			list_del_init(&front->rreq_link);
 			front = list_first_entry_or_null(&stream->subrequests,
 							 struct netfs_io_subrequest, rreq_link);
 			stream->front = front;
-			spin_unlock_bh(&wreq->lock);
+			spin_unlock(&wreq->lock);
 			netfs_put_subrequest(remove, false,
 					     notes & SAW_FAILURE ?
 					     netfs_sreq_trace_put_cancel :
diff --git a/fs/netfs/write_issue.c b/fs/netfs/write_issue.c
index c186221b45c0..10b5300b9448 100644
--- a/fs/netfs/write_issue.c
+++ b/fs/netfs/write_issue.c
@@ -203,7 +203,7 @@ static void netfs_prepare_write(struct netfs_io_request *wreq,
 	 * the list.  The collector only goes nextwards and uses the lock to
 	 * remove entries off of the front.
 	 */
-	spin_lock_bh(&wreq->lock);
+	spin_lock(&wreq->lock);
 	list_add_tail(&subreq->rreq_link, &stream->subrequests);
 	if (list_is_first(&subreq->rreq_link, &stream->subrequests)) {
 		stream->front = subreq;
@@ -214,7 +214,7 @@ static void netfs_prepare_write(struct netfs_io_request *wreq,
 		}
 	}
 
-	spin_unlock_bh(&wreq->lock);
+	spin_unlock(&wreq->lock);
 
 	stream->construct = subreq;
 }

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

