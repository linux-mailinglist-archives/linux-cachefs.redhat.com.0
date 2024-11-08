Return-Path: <linux-cachefs+bncBDLIXLMFVAERBGEXXG4QMGQE7KXVP3A@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B50C9C231D
	for <lists+linux-cachefs@lfdr.de>; Fri,  8 Nov 2024 18:34:18 +0100 (CET)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-2909052f115sf2406097fac.0
        for <lists+linux-cachefs@lfdr.de>; Fri, 08 Nov 2024 09:34:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1731087257; cv=pass;
        d=google.com; s=arc-20240605;
        b=aOJOmFni4u2C1DJTsujRqLBxcgcYiuaZoFwwKYqvC+uC5E0qnsjVzfR/QPVP7AdK/N
         fuP6ESiuPUlujUrnEHHDuABo8PQtGLrGvNo36UmQX/qIxoJnObB7yvQgf9543Kb9zyrI
         0zAG1NvnmpYO9xCA8uLm75G9qXoZ7sp6WwmQiZvTYEs3DCzK4F8pXb46ozXInx7Mt47g
         KPXrMqUCyCYQklgmaCpthc1FM94GzTAkI+4jB78+kLDjrMl/B9Fhz2FHAhZNi0x8ZmqJ
         SAqCNwDe1GK6h/glK9dq7HY5nntjCzMF5C5q6+4ZmX47nktWaXkAJ0udp76qY8kaQ7HV
         FwHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=D7fLZLjcvyo/Q3NNJcHUyMBXhE6DbF8MPpsasUup1dQ=;
        fh=AmLowfJe7YIyED3e3nxxmh/vDhLwuY2kyac6tMTxPIg=;
        b=hfMdBAVsylXOooqj1ifvekp0gi5dLU+PhaWRDZrrGhz0M+6YujGJFYszdyUBbGLs9M
         rRwMtQv+3bo7jEcIxbI2ZFSnfSdMaziQ3pDtC2x7eu3izJXqAiHY4dQEQ8/lb4qWLkPw
         nmFRKTBZYWkp5zRLbF/iEjyJGxq0F9vcOPJfvEre6GagbB8cB8Q+psp4Im0FwsgCU786
         N9n8N1jez3l0+MrxfuUf6Ah9giEyT42Y5yemFt55xvrseLNHBWEBC2oyqnjHJQvqiDbs
         fc9xVxRYma19dTWVJjLNv8W3ynrBE0IBxzF3/zNlrlukonyKBCWIUCNug60MiWWEzV0E
         uPfQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731087257; x=1731692057;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7fLZLjcvyo/Q3NNJcHUyMBXhE6DbF8MPpsasUup1dQ=;
        b=Yo9LAgId7/lYAKEZW22Zjk4bhZxZ6MZ/pWapzbg9WaJ25trzWbEq8U72vMm4+moBmN
         zzDbl9fgBUX3il/vLFvAD/LRZHUVwW2WvSUD26VTCe5ixaoiPIm43qYioXupzspKO0Gm
         KBh5q1KSda4C7bz0pxiXnz8jc+7f14IzGzUHCSOwjfOsIXjKR0ePLkiFOx/XUEdAqjPv
         7qYuiN8R+FZv1hB6ez22SJRVUurUuk8+c1PB6bl+SAGRjYw7WI8oPt0LDXbEeFLQmvQ3
         jV+yp46w8ny+IMHlkAR7VwaR7qh5ZcTMGEap7mSjp9HChDsxDRFj1cTP2oV+hnNuQ0vd
         tG+Q==
X-Forwarded-Encrypted: i=2; AJvYcCXzqPAntjUI2WLNyjeysTOoOIf0vJ6ieVPd0TWp08Tk4RXmYWQf6pffuL2SCM0oF5ulWohuGg==@lfdr.de
X-Gm-Message-State: AOJu0YyVY/BtY5r1fhr/GrMf8AJ7JbfxcfOXsioB2LhZYD4DWf0ES8aA
	J5P7BPd8lKjoHiYF6zQNADqgyKrOK0cr5hcHfJBbuZcf6fWwOruk+W03oaTHc7o=
X-Google-Smtp-Source: AGHT+IGz3wq5hzSk0Tg0w7XjR8qLqDWkUXX/YN3IyUpGNO7xyJltw66iWpr/sBlalEabVcHAPW9oeQ==
X-Received: by 2002:a05:6870:440d:b0:287:20ea:2db2 with SMTP id 586e51a60fabf-2956011180cmr3904662fac.25.1731087256869;
        Fri, 08 Nov 2024 09:34:16 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6870:1656:b0:288:487d:4311 with SMTP id
 586e51a60fabf-29540fae3d2ls615548fac.1.-pod-prod-02-us; Fri, 08 Nov 2024
 09:34:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVdX5v5JA8S4jCdvMrJrU5OkhThjv58oKhcO2COj2y6gCG5eupLv1BbwdGqrmLFq+k/a2ZvFYdrXwlmtFrL@gapps.redhat.com
X-Received: by 2002:a05:6808:19a0:b0:3e7:61e9:f44f with SMTP id 5614622812f47-3e7946f09d7mr4403638b6e.36.1731087256152;
        Fri, 08 Nov 2024 09:34:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731087256; cv=none;
        d=google.com; s=arc-20240605;
        b=HBF3NsXEQnYRf0VR52o4gs0I6hfzVzpHk5f+VIPuRkYnQ0GRacd8hezFjp+iR/GFul
         mHrAgZtSgLcm6/ZDuakQQ9OJxw34EfFq3aonNKdC+D+mo/LTL6JXWgrOJQ+gRv8eslDp
         XvupeBTknT/O7+8HbYlADRBkOMBxBMfMSdoUd/g5s+zlXzEG3LoejuSQ1rWudnN+pLeG
         ktfF6iYvH0PL8axiSFDFhxjBaPuzxLcNUSxbHAolIbrp76OlEYXn59u7YiVvUjadooUA
         KSEZvJMIWRCo/2Lokbb4D0CrN7bQ4em47dnOg3g5Oi97gBu1KZmKuIq5i/z1nPsnlG6w
         uRGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=Gu5E8tyC96H9fpVehZhchYQCXTYRja375CBx48Z0WNk=;
        fh=S9oLL764npqAlTwfYdPhiOTkO7VjwvYShFF/IFwF3l8=;
        b=D0xErqi+aZr5QZU92q9gJXBmNZ973toKpNcrdtWo2vbiW5rUn4NgApS935ONvQxyRo
         ZuxWnERwehE+sEEYbez+BSxHBI+t7Uguj3IfhqVAUlSI7UxxY5QcyTBkvw2hJk9FCzui
         jZumacq7jkANO+FQ6bnKkOE3sM2xTib/SAsuqcMTmKCVjuS5P5bz5ybC9aqLjf8IY5Ck
         mcg0yK6WddmnzlUSP/pUxMOgoEqv+RfTaGbfOgKqdkVQ/6qvRXLi/Wt7z1dFXbGklA5d
         6NG9uRYUghci6EijyiTVZhmMmrsB0jk33uPAlMNA6O52wVvPnMjf9/c2fR5m2YpNQ970
         6jKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3966b038csi45722146d6.447.2024.11.08.09.34.16
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 09:34:16 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-362-j-e4zmvFOO2fVxr40O0jSg-1; Fri,
 08 Nov 2024 12:34:14 -0500
X-MC-Unique: j-e4zmvFOO2fVxr40O0jSg-1
X-Mimecast-MFC-AGG-ID: j-e4zmvFOO2fVxr40O0jSg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BFC4019540EF
	for <linux-cachefs@gapps.redhat.com>; Fri,  8 Nov 2024 17:34:13 +0000 (UTC)
Received: by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix)
	id BB752195E486; Fri,  8 Nov 2024 17:34:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk.com (unknown [10.42.28.231])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EE274195E481;
	Fri,  8 Nov 2024 17:34:07 +0000 (UTC)
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
Subject: [PATCH v4 12/33] netfs: Don't use bh spinlock
Date: Fri,  8 Nov 2024 17:32:13 +0000
Message-ID: <20241108173236.1382366-13-dhowells@redhat.com>
In-Reply-To: <20241108173236.1382366-1-dhowells@redhat.com>
References: <20241108173236.1382366-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z045z9aaoME4KZHpjgXXl38Fvu00rsVWAVx-WJUfnpc_1731087253
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

