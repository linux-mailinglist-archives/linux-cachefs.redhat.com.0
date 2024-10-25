Return-Path: <linux-cachefs+bncBDLIXLMFVAERBAUF6C4AMGQEENTPARQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E8F9B1002
	for <lists+linux-cachefs@lfdr.de>; Fri, 25 Oct 2024 22:41:39 +0200 (CEST)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-460df63f190sf36523451cf.1
        for <lists+linux-cachefs@lfdr.de>; Fri, 25 Oct 2024 13:41:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1729888899; cv=pass;
        d=google.com; s=arc-20240605;
        b=Z0NiJBrMN3Ahh9cUgsm9FMumcGDcZDhlX6cjG/eyZuv4d2/2bQ73IxrshrxMZ3Vm3X
         9rHjXdBzfzV2F0aZIY4enPZO9PoaA0nQvxu7eXuzKuj/q3dMAf+hlTaAO6LQpiCbA+XP
         7u8RSMIEWGR94OxOPjR7a2VFB1ybmtuA7NVzXDVLslJFejTyR7Yx/4khUkz5RqFWRwD0
         gj1QxFWR0OJvw4g5LCUeHbU4P+NUKA7n2xURNPB9q4P4E73Q12C/dNd8WRJtoC/WC750
         F8QQ9cOo9AtZ11LG7go6LklvoV4eMFcPALLFQJYXxUBRg/yI/g0F/Ct5CaDFIkpOBFHd
         +OIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=D7fLZLjcvyo/Q3NNJcHUyMBXhE6DbF8MPpsasUup1dQ=;
        fh=itJkR80be/3SoVrS4JlQAL8KMBWFOhagx56O3iJDKRE=;
        b=WehIPwqbpIXGv8ClGKeJxzIwlytJPveRhdVsksx9A5FiVbIV5W52fda9IsRQQ9NGpZ
         rpSj3hqxs6PlqO0guwskm7pt1xCJhc3AjaASfckWGnzKnprtlysmWcJdbeQs5hTVEN8h
         a8pDOUIjsXoyKypy6a8IaxAvIQiIMMFT4BZx5UGySDuOIJYOHu12IEv8SDSN0t0FQl78
         74Jn+lOuf1E68YDTdrWDBgjl0rYkrqKvuhGL1/LxsU6ejL61PhOHxZYqWly9TsSK0rjt
         vWquTj3Stma8FsXsLxp2P1SLizWcdad8teKgvPltklRqcP7xeB8HWvOH4V2y8RmSohiV
         t4gA==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729888899; x=1730493699;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7fLZLjcvyo/Q3NNJcHUyMBXhE6DbF8MPpsasUup1dQ=;
        b=phcJoV1Ng9aDlpP/rd825i+oZ3gYqajIMg6xnCctToAlkBRP1NXsjTlauVmPj1ujor
         TVA7pwbFqjBWO5uzebJ9S6gPFLkQMQ3Ll+EckQkFLtIwPecYaIDLWX8eR9O3HB6CzK15
         xlx3AJrgtt/oPPi/RWVfW65rcGJYPORjWF86DYcyVqedGDm6EtkPStr6iFLufpQ57rHU
         W65WJ7zQtxafJLEo9OxHHBkcyY8H0821vCbmOgd3p4ctWscPdQUKJYqxg8/JhX9+COzp
         +Pvw2ELiKLCrP/LsZkH8QgXn7pyavJW/O/3FhMc3IFfC9NlB79k/JcvjdKFbZHqYnJCw
         Dxsw==
X-Forwarded-Encrypted: i=2; AJvYcCXwexZ67uBm6W0600pqkvmV8B3DmbsCAZ8fbqXmd5iPAICgU+JL5SvEdD52uHYIYtcTDiyApw==@lfdr.de
X-Gm-Message-State: AOJu0YxFTQ9VRUAHMAN1iU40c29bnYdR9Mvd9XfG4vmYix4UXuWjD6wi
	RKupcDexadD4Zh0QUDZwNF6B0HfmwPDb9FNDnIOIWRA8pcENKt4RUnSpP5dQOmY=
X-Google-Smtp-Source: AGHT+IEAeyY7DvigpkOPcaENywN98ytQMYP5RaqdD0/JpMgnoZ2S8nL7QxCBWF3CuZizF1n/Oe/IuQ==
X-Received: by 2002:a05:622a:1815:b0:460:e9a3:383a with SMTP id d75a77b69052e-4613c199cd1mr7306111cf.47.1729888898729;
        Fri, 25 Oct 2024 13:41:38 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:1d0d:b0:6b5:268:d754 with SMTP id
 6a1803df08f44-6ce862f1e8bls36623416d6.2.-pod-prod-03-us; Fri, 25 Oct 2024
 13:41:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV+RPwgDEw/qy3mLxDXFOwSC1Qlk3EbCoWx93htsXOoIkS7JiXKy1vzNn/b5Pc4NIMP5l4Rbnz1lMn0MyJY@gapps.redhat.com
X-Received: by 2002:a05:6214:3201:b0:6ce:348e:a8c4 with SMTP id 6a1803df08f44-6d18584009bmr10083546d6.48.1729888898115;
        Fri, 25 Oct 2024 13:41:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729888898; cv=none;
        d=google.com; s=arc-20240605;
        b=lnXNGBLRNps8Kh9/Y0kECYB81dKJlYfF95ngBZod0JMR2/xdMEWBWRQrSRDT1bv1sB
         MRJxKlf0ZVStA4yFRS75lzDiKyvbh5rzizTZqXqAETtyUTzUD/OmLzN8Lsu2ERlYWmHU
         TZISO7jt8837jihZmCd0O8O4FortgB/J49kCF5//0t1xVABo02Jv0OaK3w+IGvxK3QGi
         sXIVhJZaKcgaPJExmv2uO9N00H0jeAbfsgfe+ajjiY/2/Et0XiDZGw7caRH6HN/O8iOC
         mYgl4qUNaFLzZ2Oe7kKxysXIlhUNRgDf2C1gDvcs22BZNdA8tccMVsbX1UTUIN+LF0Y9
         194A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=Gu5E8tyC96H9fpVehZhchYQCXTYRja375CBx48Z0WNk=;
        fh=S9oLL764npqAlTwfYdPhiOTkO7VjwvYShFF/IFwF3l8=;
        b=idPeo+KALzF/DXqXyP5BtPwDarB5Itpfj4U0HtKL1KyBW8Z7wDomK0BNuOL1s4aX77
         lHu+mzhU+vosW2G0nwgami40yOdwDbXwGHQQax6sd6hrpYlXjrtoidxs1R2u57sZKDHt
         FDa5Y4BwnQapCjwy6leB3d0eKnhwNzfSGFENhYFs9TTKMBrkaAnfVkwBRFLj/mTonbVd
         Hr+WkxeFS1gpYT8ywmjGLSsVfzskyZyK1avNqegJSyF99cT+w8P+yqQFm7PCZZBZLIyb
         BLVpmcbvZdSirolmZX8XgLoda+69LHxnkKxiVYANosBn78S/2Sa+kgamSX1jw7lqZ55U
         eQSA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [170.10.128.131])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d17986b63fsi24412616d6.120.2024.10.25.13.41.37
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 13:41:38 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-625-9AjnEZ-ZPX-qeYA7ujYFTQ-1; Fri,
 25 Oct 2024 16:41:36 -0400
X-MC-Unique: 9AjnEZ-ZPX-qeYA7ujYFTQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CF1EE1955EA3
	for <linux-cachefs@gapps.redhat.com>; Fri, 25 Oct 2024 20:41:35 +0000 (UTC)
Received: by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix)
	id CA03E196BBC0; Fri, 25 Oct 2024 20:41:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk.com (unknown [10.42.28.231])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5FBA4196BB7D;
	Fri, 25 Oct 2024 20:41:30 +0000 (UTC)
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
Subject: [PATCH v2 11/31] netfs: Don't use bh spinlock
Date: Fri, 25 Oct 2024 21:39:38 +0100
Message-ID: <20241025204008.4076565-12-dhowells@redhat.com>
In-Reply-To: <20241025204008.4076565-1-dhowells@redhat.com>
References: <20241025204008.4076565-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
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

