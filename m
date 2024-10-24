Return-Path: <linux-cachefs+bncBDLIXLMFVAERBG5J5G4AMGQE4K6NWVQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B2D9AE77E
	for <lists+linux-cachefs@lfdr.de>; Thu, 24 Oct 2024 16:07:25 +0200 (CEST)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-5eb61b55b47sf802868eaf.2
        for <lists+linux-cachefs@lfdr.de>; Thu, 24 Oct 2024 07:07:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1729778844; cv=pass;
        d=google.com; s=arc-20240605;
        b=SpnKt7SP7CEdu7f0yayndEnXnPYpV9R/J9mE0i+4xI81bKFkGWCkO7SMlxhpY4vmnl
         K49ocENNOLAC8TvaAwLSzGsNFoD9KqlgEofg1e81DB52PWh19cM3IilSKqbdSAFb20yD
         lTXUwDU4nlwd+OMkGMVbhCY+9n+gTdUoVKMl4kMQLBmgQgFH8bIiM2m7lvOonZUnphs8
         kzIXvhoULgXbFXpzlpS+P6OYXcs0OzIHDO/xm7xhBl8kfro54zfiXayHpY4h0InU+cRn
         VTvCWNamBpmjvKtIEifxQ+fKaSpK8UBC016Bl6xi1yu+l0Qi7mqvcQ6vqjTfHf9SGI70
         gVRA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=D7fLZLjcvyo/Q3NNJcHUyMBXhE6DbF8MPpsasUup1dQ=;
        fh=G4qCTMAyH9b5+GDBhoTtMtKMuwbfaLZ5ZxtUkiW0Kcw=;
        b=h09UKUY19Rf8gqi9//8WHcGQjNsbKlABEr0npHZ3SS7FiMAdUDBd4r5le3h3W0QOCm
         fWrqFd7VsOxuCYvk/zyKfSQQljtYNrFrU5BjkZTGurXmc+1CCpl+nU1K8rtTT9t2OI4l
         XHRXuXmFPX8V7J768JCqJMEpsooB6J92asdzqMn8X5Gf50gxnkW0KU55gvVUSMNh1n37
         thUBtr80xF1NwzR5w9FXA67fW2GldhW1TbhwAquI3kMqubNnF5oHMIPHc6wWDb1VFWMH
         ThuMQRKhsz1FSIFtI9xONK6tGTosqPZ0vwrNB9minwZ3XgfcCYAUTiivM+ERn2Njn8Ng
         PKwA==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729778844; x=1730383644;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7fLZLjcvyo/Q3NNJcHUyMBXhE6DbF8MPpsasUup1dQ=;
        b=NFNIYYi2/x0b4ywGPd7rT13kCXHlPuD/xw9xtpcLFGVOrlAY7ekMoH08J5hpPO1VIQ
         WvIqAeUxDbp5ROTI2XJOto4VGlTGAQFxc4MSGvrtp+RcUOHBJLNdifIQDxArwCfpsmaO
         PbWPdrIe4RcoFjArUIa9vkzBqAQM4AFUNIzb4wS44RFHhZz9nRAyqPJLV0Ihpo28eLmi
         h3Zcwa7dD4l3tRYhDzsY7rJ74N6NBs6GsTdH55x4pE7n1kKDSC89nYzIaflIpUVI1Rz9
         hlNciRmQCXnxpslL+usHUKIUscCnhHtglPJr3+HVr5D2wHlJWXiajxpB0zihdzxiALH3
         uLfw==
X-Forwarded-Encrypted: i=2; AJvYcCXU/1cv9U7G4s7KaG+jhO4y9zvGaFBNlEmi1g8S9nYlZ2T7CyUTxy3WXt9fAa8w+CNgFs51Bw==@lfdr.de
X-Gm-Message-State: AOJu0YxqrZytIz74BMdDnyJxILsFz8gvxZOhGixgROd3PA+vbt96f0vc
	rBkZGj6fMDtCLy95EiuTQENxGgHEOZX5Gt0xaVqn50o4ty3B2BsP7Gsy8Wcoz9o=
X-Google-Smtp-Source: AGHT+IFraKvHcz2xr8SiACFGJ/Ac30ovpdsWmYkYiqJZo5BkipYOJ7Oq7gow5rcV1PuER0o4U6EZ0A==
X-Received: by 2002:a05:6358:7e9b:b0:1b5:f95a:5a67 with SMTP id e5c5f4694b2df-1c3e4d316c7mr73540155d.15.1729778843560;
        Thu, 24 Oct 2024 07:07:23 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:578d:0:b0:45e:f111:4db with SMTP id d75a77b69052e-46122b32b02ls15543761cf.0.-pod-prod-08-us;
 Thu, 24 Oct 2024 07:07:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUFlqrQKaLIWXec3UlFKRA/rclkPGN+FSqZeuOXViJ8XtUdtO6L8pxR9s9lj5w1GXFSoAa9A3V1r0UE1ZcY@gapps.redhat.com
X-Received: by 2002:ac8:7e83:0:b0:458:243c:e3e5 with SMTP id d75a77b69052e-461258b260amr22043781cf.23.1729778842875;
        Thu, 24 Oct 2024 07:07:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729778842; cv=none;
        d=google.com; s=arc-20240605;
        b=Z3y9wtzRo11duAJFXi+qjy1morPHQ1hbkK8zP/Q53xuEkClKOuGdwj3+QhAMXlm9Og
         +BqFMum6d9ON3nuB7rYY3wNEYqFgHHmtzf8rvPdvRcv8s15PKQqgMs0hmfF73k0UoKRu
         qyxlt5YEMqDh2e0swoKHPqIt7E0rRjU2AsWupsCBhiKaTc5Oq9hAg4dcTkRbZkLelVeO
         0wp7k8NK1PTPJti/ce5AFmZwnHOjsxYwaf+h+YoEIejsEV0iZHhvE8FjqlMNGvAaNrqr
         79sf16B7PWhxUHB086+WLEi5WoYSu9nN6cZmZPlgpIzvWumB9M6ZwH+l4/TvM3i/PRM1
         vljQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=Gu5E8tyC96H9fpVehZhchYQCXTYRja375CBx48Z0WNk=;
        fh=S9oLL764npqAlTwfYdPhiOTkO7VjwvYShFF/IFwF3l8=;
        b=LoX4Sp8GeT1Svm2RDJUC2GH+4AZb5MNK2qCWZhkUWXR9MeGOBvrkXsiPSSCU2mvOWS
         VC/+NlfwsTNtdsmkgWDtI0RYJ1VVIVT/ovK2P7VrRRTmzoNoIC57Vv9BzG/Ef1thvl5v
         6iWr4NvK7EZfF5YhXUyMy7ROERNDGi12msU7udpRkwNMRd3Xra83Hw2cclI1O/3E6Sxk
         HatC9Srw8uV3hPJXz5iHMDdosVn3+67nx0/arSd7R/4PGkhOUEb5zzKZxaNBbAd046XF
         Vsc91OXOQJXmQ30X+hGNscZl7Okw5bhhb8aXUb2OcYba5e0Ir8JVFnpEbFqyMHCW61K1
         OPzw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [170.10.128.131])
        by mx.google.com with ESMTPS id d75a77b69052e-460d3dae20bsi111298711cf.767.2024.10.24.07.07.22
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 07:07:22 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-327-D-LXiRydOPW-TMAqMTfdLw-1; Thu,
 24 Oct 2024 10:07:21 -0400
X-MC-Unique: D-LXiRydOPW-TMAqMTfdLw-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6AC7C1955D56
	for <linux-cachefs@gapps.redhat.com>; Thu, 24 Oct 2024 14:07:20 +0000 (UTC)
Received: by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix)
	id 64BF01956046; Thu, 24 Oct 2024 14:07:20 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk.com (unknown [10.42.28.231])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2D1A019560B2;
	Thu, 24 Oct 2024 14:07:13 +0000 (UTC)
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
Subject: [PATCH 11/27] netfs: Don't use bh spinlock
Date: Thu, 24 Oct 2024 15:05:09 +0100
Message-ID: <20241024140539.3828093-12-dhowells@redhat.com>
In-Reply-To: <20241024140539.3828093-1-dhowells@redhat.com>
References: <20241024140539.3828093-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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

