Return-Path: <linux-cachefs+bncBDLIXLMFVAERBTNBQK5QMGQETVN4RAA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF649F3B1E
	for <lists+linux-cachefs@lfdr.de>; Mon, 16 Dec 2024 21:42:54 +0100 (CET)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6f943f5absf725960985a.3
        for <lists+linux-cachefs@lfdr.de>; Mon, 16 Dec 2024 12:42:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1734381773; cv=pass;
        d=google.com; s=arc-20240605;
        b=VdQEmVy2mTmIY67NlMhd6Oh7rR3cveEWi+rjwpz356KqgcDrwzVZCR1DDSFVeYl9yS
         2iQKvqER0KRqv5hI6CmcWUsHCUGoE9fD5QdWCCBnJQiEC6Dm9XPyqg4aXmotOSS5DNvW
         1y3ik5vTwxGBBJKoc4Ar+lB8KoyD9uIplxjuF5Bnk41Lx2j5AqPQ8C44x2TxNdF4kVzp
         QdEk8Mmw/d3916rWUZ/fKXyyNH9fnVhk6guC8FvIHJkZnSa9Dv8hB77mREL+jCwqNt0y
         MOfg5yZ158gVUZxTrJsVq6f0yovnnloZynT1gyjZ0vQbI9/XyhijnbJ8vZ3LM6ZwfyCm
         zVjw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=+8+h83gyY8VLyVKLEhGhm6W0Cp8+LZQhuK1wYO5JpMs=;
        fh=aJzb7LpdzyQzqHSbdZ4Ig2TaSqSe6AA832+oa20hZqo=;
        b=b6kG+1c4H93mVxcpTmHH8xcjc9dZ5v9X4rdt5LceNnDEOx9aVSS6TvEjc8l93vieOj
         +4JrDexBqjkp6p+pwOQugJ9BhAU4eQxsvSLC1gcOMu3uhjI82y0t60qLCrPM5OlvUj/q
         n7tmsK5OK73+Xd2+n+aCQP2NJKf8w/QVEAr49qKSNTXi0ZxXpJOC5jqEHo7LCsxVCCkF
         tuCYqzf5xDQnmV8muQGxvFh2GnvUuLbqvU37b5SC8i1cxGceTqWaTq0aS8QCZ6n4TuVU
         Vro9bW+Ss/96KpZidycCPMx+FN/0/Amb/Ely8AA5KUwjhTu0ceTyEEZdp358HnKQwqxy
         kSkQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734381773; x=1734986573;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8+h83gyY8VLyVKLEhGhm6W0Cp8+LZQhuK1wYO5JpMs=;
        b=h8ep5VZxe1ck/q1CUkZRqU0zQO+t2EXNbcN9pyyB+V1eECILsHV1G+g3GbZH51uoSR
         64Lc3UfR4HmuL4KAuydyAFRxOQvux8Tdco4H65oXM+mtv8eL2pk7p+Ubv01tCwziGOZ0
         LEksyxubXYmZBM6KAnSsxT7WR9rEt3NvDFymQFQ6/vCB7fVOlO8CAqQ9AYi2aopWv+SD
         9QfywcsAE/cxqJfMv7S4lLlFxH/Stp3ffGbJWpfXmR5CSzzzlH87sPBcjXn8P79ADJwo
         qpzJ+CR504nLcvaf+I3UyIx47a+OlPPv7WSlMZhG65PfffXXwtZ71gqWHwfcIUZdwHFM
         TeLA==
X-Forwarded-Encrypted: i=2; AJvYcCUONC10JKrXx1IEH3ROtrRHVd0gb70Bht20D84YG5g9tpQTcBsCk/81UiELJMiae4/pSc0Cww==@lfdr.de
X-Gm-Message-State: AOJu0YxFJymQLMID6ya9Z3cpynfrEDhLNZC+EuTh4yMmhhbJNfSGU0z+
	o637c/m5J0FADZhNsPdTFVQywf2Rp2pIGimI/YDzvsjtWJ9FYNj7ACuWUzd39KY=
X-Google-Smtp-Source: AGHT+IEU2HVo2i5WDEnrVAolpdvB8/CFbuQGEYUzEOEqnByRj5oUkk1rM9/s0Cn/d6A/MKZhUf9L4Q==
X-Received: by 2002:a05:620a:6182:b0:7b6:e8d4:9b82 with SMTP id af79cd13be357-7b6fbf15bc5mr2536419185a.33.1734381773484;
        Mon, 16 Dec 2024 12:42:53 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1897:b0:467:6771:ac55 with SMTP id
 d75a77b69052e-467a6757894ls43071831cf.1.-pod-prod-06-us; Mon, 16 Dec 2024
 12:42:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWYTPAyCQFIF1o5pkhe7GISvNAB7o5P+zeQWC+issVW5k35BzpWVmkySO7lkNBNs97QOKkAbldDOGujiPBc@gapps.redhat.com
X-Received: by 2002:a05:620a:4728:b0:7b6:dac1:cb73 with SMTP id af79cd13be357-7b6fbf7dc2bmr2438144085a.56.1734381772724;
        Mon, 16 Dec 2024 12:42:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734381772; cv=none;
        d=google.com; s=arc-20240605;
        b=M9km1Qu6UsxQPZJ/6nDj8syR8lqWagkP7kgltVGFyeGJXbhPCJa69MTBukY6XQGKCs
         yz55qj2xPyLSAS5Iat+yLpyuEprIZqt9eKVGwzEyVIh/eq31bU72OiQnZoneZhGRMg7r
         aOsopy9w32qgvrY7M48anUMmOXYGVUUxQHF8Pf8VaG/XCbGtCkThZ1GoUPBZVYTCS4fp
         jfCgG9LmYPqK+rUskFwfne+oHIgrQmoJJq2pROhJB7MIfEFjAvv3vp1Vt3n+t2SqdaJB
         ZPQUxR1SVm2m67N18GNHoAnZDGUI3d+Esjd+ggTmX+3lYcKiykzhRx1q6RWzlORPMJxl
         fxAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=R1KN0H1DyrTJ9oId0tb+k5ruXvxmzXbOtML0jIjZVz8=;
        fh=S9oLL764npqAlTwfYdPhiOTkO7VjwvYShFF/IFwF3l8=;
        b=LTb5OyP9Ba6EkeXXQiEpTWKaqIo9XFp+sYi6gZRIaBJsjoV6QKC+69OWglyy72b1MP
         AX9lU2o7H9QHsPM0PRuDBWa3f/6vP/PgUuB8b23QBFBz1CGFx/83FBmC6CrXWzhPF3/J
         8h+jELnOyDG0QvDELN6dPklt6EYMrfSf4msUf2ywYjtVryPcjegnxoSPqW9x+DstN9V+
         gM7f4YNnLnK7xfWzEnW+vhjOeLDSolfIM51jenwRUKTHN12K+JnjWq4OE4zMw2mSrv/p
         M+XbGi1fhBnSK57pgmzzzjOcsNLC7ru7jhWwyCVwPXuKohyF9IHErH21smwXy/bwb//W
         yXFw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [170.10.128.131])
        by mx.google.com with ESMTPS id af79cd13be357-7b7047ef217si821233885a.206.2024.12.16.12.42.52
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 12:42:52 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-303-T3Effbj8NgK8URgyNGf2UA-1; Mon,
 16 Dec 2024 15:42:51 -0500
X-MC-Unique: T3Effbj8NgK8URgyNGf2UA-1
X-Mimecast-MFC-AGG-ID: T3Effbj8NgK8URgyNGf2UA
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 815561955F44
	for <linux-cachefs@gapps.redhat.com>; Mon, 16 Dec 2024 20:42:50 +0000 (UTC)
Received: by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix)
	id 5C004195605A; Mon, 16 Dec 2024 20:42:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.48])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 18CA519560AD;
	Mon, 16 Dec 2024 20:42:43 +0000 (UTC)
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
Subject: [PATCH v5 10/32] netfs: Don't use bh spinlock
Date: Mon, 16 Dec 2024 20:41:00 +0000
Message-ID: <20241216204124.3752367-11-dhowells@redhat.com>
In-Reply-To: <20241216204124.3752367-1-dhowells@redhat.com>
References: <20241216204124.3752367-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wCvYY9rHGvnfo0kc-1tUnkUyMd7K_R4rO3WCSyyTSaY_1734381770
X-Mimecast-Originator: redhat.com
content-type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
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
index fa1013020ac9..4ff4b587dc4b 100644
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
index 454a5bbdd6f8..26e430baeb5a 100644
--- a/fs/netfs/read_collect.c
+++ b/fs/netfs/read_collect.c
@@ -144,7 +144,7 @@ static bool netfs_consume_read_data(struct netfs_io_subrequest *subreq)
 	prev_donated = READ_ONCE(subreq->prev_donated);
 	next_donated =  READ_ONCE(subreq->next_donated);
 	if (prev_donated || next_donated) {
-		spin_lock_bh(&rreq->lock);
+		spin_lock(&rreq->lock);
 		prev_donated = subreq->prev_donated;
 		next_donated =  subreq->next_donated;
 		subreq->start -= prev_donated;
@@ -157,7 +157,7 @@ static bool netfs_consume_read_data(struct netfs_io_subrequest *subreq)
 			next_donated = subreq->next_donated = 0;
 		}
 		trace_netfs_sreq(subreq, netfs_sreq_trace_add_donations);
-		spin_unlock_bh(&rreq->lock);
+		spin_unlock(&rreq->lock);
 	}
 
 	avail = subreq->transferred;
@@ -186,18 +186,18 @@ static bool netfs_consume_read_data(struct netfs_io_subrequest *subreq)
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
@@ -213,7 +213,7 @@ static bool netfs_consume_read_data(struct netfs_io_subrequest *subreq)
 
 			if (subreq->consumed >= subreq->len)
 				goto remove_subreq_locked;
-			spin_unlock_bh(&rreq->lock);
+			spin_unlock(&rreq->lock);
 		} else {
 			pr_err("fpos > start\n");
 			goto bad;
@@ -241,11 +241,11 @@ static bool netfs_consume_read_data(struct netfs_io_subrequest *subreq)
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
@@ -296,11 +296,11 @@ static bool netfs_consume_read_data(struct netfs_io_subrequest *subreq)
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
index a2021efa44c0..a33bd06e80f8 100644
--- a/fs/netfs/read_retry.c
+++ b/fs/netfs/read_retry.c
@@ -142,12 +142,12 @@ static void netfs_retry_read_subrequests(struct netfs_io_request *rreq)
 			__clear_bit(NETFS_SREQ_MADE_PROGRESS, &subreq->flags);
 			subreq->retry_count++;
 
-			spin_lock_bh(&rreq->lock);
+			spin_lock(&rreq->lock);
 			list_add_tail(&subreq->rreq_link, &rreq->subrequests);
 			subreq->prev_donated += rreq->prev_donated;
 			rreq->prev_donated = 0;
 			trace_netfs_sreq(subreq, netfs_sreq_trace_retry);
-			spin_unlock_bh(&rreq->lock);
+			spin_unlock(&rreq->lock);
 
 			BUG_ON(!len);
 
@@ -217,9 +217,9 @@ static void netfs_retry_read_subrequests(struct netfs_io_request *rreq)
 		__clear_bit(NETFS_SREQ_FAILED, &subreq->flags);
 		__clear_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags);
 	}
-	spin_lock_bh(&rreq->lock);
+	spin_lock(&rreq->lock);
 	list_splice_tail_init(&queue, &rreq->subrequests);
-	spin_unlock_bh(&rreq->lock);
+	spin_unlock(&rreq->lock);
 }
 
 /*
diff --git a/fs/netfs/write_collect.c b/fs/netfs/write_collect.c
index 237018caba27..f026cbc0e2fe 100644
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
index 7a14a48e62ee..286bc2aa3ca0 100644
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

