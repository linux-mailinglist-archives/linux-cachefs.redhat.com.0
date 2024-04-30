Return-Path: <linux-cachefs+bncBDLIXLMFVAERBXHTYOYQMGQESGY4YWY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mail.lfdr.de (Postfix) with ESMTPS id A52978B77E2
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 16:02:05 +0200 (CEST)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3c704fc4b32sf8094259b6e.1
        for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 07:02:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1714485724; cv=pass;
        d=google.com; s=arc-20160816;
        b=yhbj1eVJ9BEOJP0Y8UACHWeSMoCEQgMxxkpJRWgQuLfsd85R4K1ANVv4YNkB/cKbq3
         xQDBuQ3DD1MXBI5cAGWxok01eB9vqCbSFa9OBQBBJ0npB7YXtA9EOQ713S9/4BerNtbl
         0dFkd7M7L5/7rlvSdjmq3mOBxc/rnKFalZNOJpq9rHGEmaJLt3IMJOYiy9X1noS+bnZE
         Ma7MAVl57zQ9aqngssGYCYgnj6Yi3wDsHmsYc4uCZeqwKXN9wPNi/0oM75DTSZ1zIUSb
         RbEw1d3TllHyfKF4hxsXCY8ixeNCqCiVlyqVZDn1BxU3D2K1znYnDH4BBtkNcwVX1Ykd
         9Rxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=5sjgLtLpGkbZ8nYzd85yqDXTVzgrupNHKYLUsSi6Kdo=;
        fh=TrWXlWxcW6MgSfPgNmwIUXc7xS746XaMYnLD/xytgbo=;
        b=0m2m38TNexKiR2LaYhNpM+Q62MK+Rr8Q/n5e3LacYx2V/f6rlc9AZ3WR2TPscrKNy8
         vFEN8VHGlv9jqccBzjxYlR1FGhAxUsd3hNuK1sZe5KlBfi99ZSXWqZ8rMcrOwfqzKA7z
         drqfO0ktfMiOUTfLH9ktx/PfLCNxuZPQowkMli9ywUo2OvdwzB8xMbUP+GwtLExfuzfv
         /PvZcRb2cNuwp8WHe639AXySej8dyiAneZVj67uLBxMVKf2vWL1qeQAuPDvu9f36wLcR
         THhmPRx48c2UIomvx7ACK/PW7Bx/Knsbr1ap41IoM149iH/gWeIXVyyD5bgxSzgl9BeM
         oPbQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485724; x=1715090524;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5sjgLtLpGkbZ8nYzd85yqDXTVzgrupNHKYLUsSi6Kdo=;
        b=u5A7LWSBmxnzEE+mC6XCfILyfOCZv3jtLFyVkQ1tC/xFHeFJGHlpAMuCnaxup0SavG
         u0WEwBOLYf3YsPpI5JfArAXq9VOEQcAOIN+1ANZK3GAv4nlO7fJOjzMPqGMEKHEeapsF
         3Q+FWiIaGtLPvuxrYQK+S+fk1YiZ+wfho/VEPoQJupNMu6JWzvCQRt1ruaiLBkaqTalt
         WrFb1Q8ldTJ2hGp8ro5EuGSz7RH77oLVdl0sQspR2iiyzepc2HjYljCXrXGLBIDUoIKh
         K/NfjcCV4YmH7oJgqSVRP32unV6hFF9lbDatkU9Unz/U87PoQf5zCsa9+kpwG3ShoJlm
         oWzg==
X-Forwarded-Encrypted: i=2; AJvYcCX6YS0hHr4SqVpOtliALFRBLW5ZrXIZsSAxmwvG7mBqVN05RPiGVHfkkiQfEA0By0X9U19I4WDOe75KH9dRJssldky9DacRBQHlF6g=
X-Gm-Message-State: AOJu0YyJ8CVp+cHnNQbbKht1X9OjBpk7zPyOX0sZP73gFMEtiol7eFLu
	n/xA58Ii6hXjhm6lqaRA1na1NgAG+983vsIjboeyEEIKCvdLGK1ihaQEFdpoP/s=
X-Google-Smtp-Source: AGHT+IHltePg46PkWQoy+U2fJ1DABQpSVWVRFqHgv/tTReI3yrocFt1PwuFeA44pwrNm9zsWD8obUw==
X-Received: by 2002:a05:6870:b003:b0:233:4c14:bb1 with SMTP id y3-20020a056870b00300b002334c140bb1mr14330433oae.10.1714485724379;
        Tue, 30 Apr 2024 07:02:04 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6870:64a9:b0:23c:9eaa:9faa with SMTP id
 586e51a60fabf-23c9eab4016ls90934fac.0.-pod-prod-09-us; Tue, 30 Apr 2024
 07:02:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUl9WkOpKSyL2Bru/4XcyVwR0F2wgkubsjGwMj9KVyT2hAvYyWBu8GeAOvWnj1L+H4oaOzbdrINbGh7dgFa5CDGHOZZDJFxmD+tV3XHb4E=
X-Received: by 2002:a05:6808:219a:b0:3c8:2b77:789 with SMTP id be26-20020a056808219a00b003c82b770789mr18705545oib.5.1714485723631;
        Tue, 30 Apr 2024 07:02:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714485723; cv=none;
        d=google.com; s=arc-20160816;
        b=zgmZQ0rTfYLHGC/MsQhfqXu4gApv+ZMas5/qePnDMBjxJvPVrPNxTkleUM/Y5XrmJl
         ZhVfC17/+CDib4zzAjG3/ytWEgDo8NlXs9kD7c8p5YNCajclAAqEG2KpE7sN/+PvP1Jv
         mkfPgGfYnE2n2V61ZlCS+JRztFaL5fHW0HCaR2J73L5d0O/x0jcIGF3l6CX93G4gV+Te
         QElbweVWlHPfkWR0rlZcWDKcAG5ZRuQeOFWtHhFXYaqEhk9Ox12sQHQ16m14d4Ghah+p
         BksCtN8QFdpXNe2GRPhsCoNUVhqCfPobu/Z2jMSlBhVs2fROucRdE6Q5uhToVMlWUp33
         1xlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=w6jBpd96zxwzDPK+ctGz8ny53XrmMmE04lbG5qM/Yto=;
        fh=eNkeuWBuJiiZHvhWmkIgM3Sq5hhFRf7/CRRt+PVbNDI=;
        b=FiAeuAGzU2alwNqIMC+tAocL0mqTqiaMYkRto+6PaNGUxYekA+fZJnuRp/qex3b9Zu
         pKsSc3xY68rEWCxEmHP0wfSRMcuOUqCw1oxyXYejGrMjxtvA0ME+hFLrs6PoYtGEoxXP
         OpSJw7gxa6Rm5Gm2WzYZNMEcwlpD2884g2KokmVRrhAgjOFI4WfqEZYrH5Xu4YftGGg6
         v2bKwF9El4hnrhi7VL3Nfkrv1rcMV8Zbo6EWlC/7dgcHXgM9uAxasgmJKm7f/HGN1YGE
         1zX6XyUcOr+MCqGyU61LOQBHrf4drRoZvvybblVoNwP9On0R3c5gKhio3kZjR6V2/fuj
         2w2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id p26-20020a056102201a00b0047b80220791si4525683vsr.348.2024.04.30.07.02.03
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:02:03 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-HaPG8qdrNYmdFY0LxgR11Q-1; Tue,
 30 Apr 2024 10:02:01 -0400
X-MC-Unique: HaPG8qdrNYmdFY0LxgR11Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D95B53C025BE
	for <linux-cachefs@gapps.redhat.com>; Tue, 30 Apr 2024 14:02:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id D58FDEC681; Tue, 30 Apr 2024 14:02:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9F0DBEC680;
	Tue, 30 Apr 2024 14:01:57 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Steve French <smfrench@gmail.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	netfs@lists.linux.dev,
	linux-cachefs@redhat.com,
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
	Xiubo Li <xiubli@redhat.com>
Subject: [PATCH v2 13/22] netfs: Switch to using unsigned long long rather than loff_t
Date: Tue, 30 Apr 2024 15:00:44 +0100
Message-ID: <20240430140056.261997-14-dhowells@redhat.com>
In-Reply-To: <20240430140056.261997-1-dhowells@redhat.com>
References: <20240430140056.261997-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
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

Switch to using unsigned long long rather than loff_t in netfslib to avoid
problems with the sign flipping in the maths when we're dealing with the
byte at position 0x7fffffffffffffff.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: Ilya Dryomov <idryomov@gmail.com>
cc: Xiubo Li <xiubli@redhat.com>
cc: netfs@lists.linux.dev
cc: ceph-devel@vger.kernel.org
cc: linux-fsdevel@vger.kernel.org
---
 fs/cachefiles/io.c           |  2 +-
 fs/ceph/addr.c               |  2 +-
 fs/netfs/buffered_read.c     |  4 +++-
 fs/netfs/buffered_write.c    |  2 +-
 fs/netfs/io.c                |  6 +++---
 fs/netfs/main.c              |  2 +-
 fs/netfs/output.c            |  4 ++--
 include/linux/netfs.h        | 16 +++++++++-------
 include/trace/events/netfs.h |  6 +++---
 9 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 1d685357e67f..5ba5c7814fe4 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -493,7 +493,7 @@ cachefiles_do_prepare_read(struct netfs_cache_resources *cres,
  * boundary as appropriate.
  */
 static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subrequest *subreq,
-						    loff_t i_size)
+						    unsigned long long i_size)
 {
 	return cachefiles_do_prepare_read(&subreq->rreq->cache_resources,
 					  subreq->start, &subreq->len, i_size,
diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 74bfd10b1b1a..8c16bc5250ef 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -193,7 +193,7 @@ static void ceph_netfs_expand_readahead(struct netfs_io_request *rreq)
 	 * block, but do not exceed the file size, unless the original
 	 * request already exceeds it.
 	 */
-	new_end = min(round_up(end, lo->stripe_unit), rreq->i_size);
+	new_end = umin(round_up(end, lo->stripe_unit), rreq->i_size);
 	if (new_end > end && new_end <= rreq->start + max_len)
 		rreq->len = new_end - rreq->start;
 
diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 1622cce535a3..47603f08680e 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -130,7 +130,9 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
 }
 
 static void netfs_cache_expand_readahead(struct netfs_io_request *rreq,
-					 loff_t *_start, size_t *_len, loff_t i_size)
+					 unsigned long long *_start,
+					 unsigned long long *_len,
+					 unsigned long long i_size)
 {
 	struct netfs_cache_resources *cres = &rreq->cache_resources;
 
diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index d8f66ce94575..eba49bfafe64 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -664,7 +664,7 @@ static void netfs_pages_written_back(struct netfs_io_request *wreq)
 	last = (wreq->start + wreq->len - 1) / PAGE_SIZE;
 	xas_for_each(&xas, folio, last) {
 		WARN(!folio_test_writeback(folio),
-		     "bad %zx @%llx page %lx %lx\n",
+		     "bad %llx @%llx page %lx %lx\n",
 		     wreq->len, wreq->start, folio->index, last);
 
 		if ((finfo = netfs_folio_info(folio))) {
diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index 8de581ac0cfb..6cfecfcd02e1 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -476,7 +476,7 @@ netfs_rreq_prepare_read(struct netfs_io_request *rreq,
 
 set:
 	if (subreq->len > rreq->len)
-		pr_warn("R=%08x[%u] SREQ>RREQ %zx > %zx\n",
+		pr_warn("R=%08x[%u] SREQ>RREQ %zx > %llx\n",
 			rreq->debug_id, subreq->debug_index,
 			subreq->len, rreq->len);
 
@@ -513,7 +513,7 @@ static bool netfs_rreq_submit_slice(struct netfs_io_request *rreq,
 	subreq->start		= rreq->start + rreq->submitted;
 	subreq->len		= io_iter->count;
 
-	_debug("slice %llx,%zx,%zx", subreq->start, subreq->len, rreq->submitted);
+	_debug("slice %llx,%zx,%llx", subreq->start, subreq->len, rreq->submitted);
 	list_add_tail(&subreq->rreq_link, &rreq->subrequests);
 
 	/* Call out to the cache to find out what it can do with the remaining
@@ -588,7 +588,7 @@ int netfs_begin_read(struct netfs_io_request *rreq, bool sync)
 	atomic_set(&rreq->nr_outstanding, 1);
 	io_iter = rreq->io_iter;
 	do {
-		_debug("submit %llx + %zx >= %llx",
+		_debug("submit %llx + %llx >= %llx",
 		       rreq->start, rreq->submitted, rreq->i_size);
 		if (rreq->origin == NETFS_DIO_READ &&
 		    rreq->start + rreq->submitted >= rreq->i_size)
diff --git a/fs/netfs/main.c b/fs/netfs/main.c
index 4805b9377364..5f0f438e5d21 100644
--- a/fs/netfs/main.c
+++ b/fs/netfs/main.c
@@ -62,7 +62,7 @@ static int netfs_requests_seq_show(struct seq_file *m, void *v)
 
 	rreq = list_entry(v, struct netfs_io_request, proc_link);
 	seq_printf(m,
-		   "%08x %s %3d %2lx %4d %3d @%04llx %zx/%zx",
+		   "%08x %s %3d %2lx %4d %3d @%04llx %llx/%llx",
 		   rreq->debug_id,
 		   netfs_origins[rreq->origin],
 		   refcount_read(&rreq->ref),
diff --git a/fs/netfs/output.c b/fs/netfs/output.c
index e586396d6b72..85374322f10f 100644
--- a/fs/netfs/output.c
+++ b/fs/netfs/output.c
@@ -439,7 +439,7 @@ static void netfs_submit_writethrough(struct netfs_io_request *wreq, bool final)
  */
 int netfs_advance_writethrough(struct netfs_io_request *wreq, size_t copied, bool to_page_end)
 {
-	_enter("ic=%zu sb=%zu ws=%u cp=%zu tp=%u",
+	_enter("ic=%zu sb=%llu ws=%u cp=%zu tp=%u",
 	       wreq->iter.count, wreq->submitted, wreq->wsize, copied, to_page_end);
 
 	wreq->iter.count += copied;
@@ -457,7 +457,7 @@ int netfs_end_writethrough(struct netfs_io_request *wreq, struct kiocb *iocb)
 {
 	int ret = -EIOCBQUEUED;
 
-	_enter("ic=%zu sb=%zu ws=%u",
+	_enter("ic=%zu sb=%llu ws=%u",
 	       wreq->iter.count, wreq->submitted, wreq->wsize);
 
 	if (wreq->submitted < wreq->io_iter.count)
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 0b6c2c2d3c23..88269681d4fc 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -149,7 +149,7 @@ struct netfs_io_subrequest {
 	struct work_struct	work;
 	struct list_head	rreq_link;	/* Link in rreq->subrequests */
 	struct iov_iter		io_iter;	/* Iterator for this subrequest */
-	loff_t			start;		/* Where to start the I/O */
+	unsigned long long	start;		/* Where to start the I/O */
 	size_t			len;		/* Size of the I/O */
 	size_t			transferred;	/* Amount of data transferred */
 	refcount_t		ref;
@@ -205,15 +205,15 @@ struct netfs_io_request {
 	atomic_t		subreq_counter;	/* Next subreq->debug_index */
 	atomic_t		nr_outstanding;	/* Number of ops in progress */
 	atomic_t		nr_copy_ops;	/* Number of copy-to-cache ops in progress */
-	size_t			submitted;	/* Amount submitted for I/O so far */
-	size_t			len;		/* Length of the request */
 	size_t			upper_len;	/* Length can be extended to here */
+	unsigned long long	submitted;	/* Amount submitted for I/O so far */
+	unsigned long long	len;		/* Length of the request */
 	size_t			transferred;	/* Amount to be indicated as transferred */
 	short			error;		/* 0 or error that occurred */
 	enum netfs_io_origin	origin;		/* Origin of the request */
 	bool			direct_bv_unpin; /* T if direct_bv[] must be unpinned */
-	loff_t			i_size;		/* Size of the file */
-	loff_t			start;		/* Start position */
+	unsigned long long	i_size;		/* Size of the file */
+	unsigned long long	start;		/* Start position */
 	pgoff_t			no_unlock_folio; /* Don't unlock this folio after read */
 	refcount_t		ref;
 	unsigned long		flags;
@@ -294,13 +294,15 @@ struct netfs_cache_ops {
 
 	/* Expand readahead request */
 	void (*expand_readahead)(struct netfs_cache_resources *cres,
-				 loff_t *_start, size_t *_len, loff_t i_size);
+				 unsigned long long *_start,
+				 unsigned long long *_len,
+				 unsigned long long i_size);
 
 	/* Prepare a read operation, shortening it to a cached/uncached
 	 * boundary as appropriate.
 	 */
 	enum netfs_io_source (*prepare_read)(struct netfs_io_subrequest *subreq,
-					     loff_t i_size);
+					     unsigned long long i_size);
 
 	/* Prepare a write operation, working out what part of the write we can
 	 * actually do.
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index 30769103638f..7126d2ea459c 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -280,7 +280,7 @@ TRACE_EVENT(netfs_sreq,
 		    __entry->start	= sreq->start;
 			   ),
 
-	    TP_printk("R=%08x[%u] %s %s f=%02x s=%llx %zx/%zx e=%d",
+	    TP_printk("R=%08x[%x] %s %s f=%02x s=%llx %zx/%zx e=%d",
 		      __entry->rreq, __entry->index,
 		      __print_symbolic(__entry->source, netfs_sreq_sources),
 		      __print_symbolic(__entry->what, netfs_sreq_traces),
@@ -320,7 +320,7 @@ TRACE_EVENT(netfs_failure,
 		    __entry->start	= sreq ? sreq->start : 0;
 			   ),
 
-	    TP_printk("R=%08x[%d] %s f=%02x s=%llx %zx/%zx %s e=%d",
+	    TP_printk("R=%08x[%x] %s f=%02x s=%llx %zx/%zx %s e=%d",
 		      __entry->rreq, __entry->index,
 		      __print_symbolic(__entry->source, netfs_sreq_sources),
 		      __entry->flags,
@@ -436,7 +436,7 @@ TRACE_EVENT(netfs_write,
 		    __field(unsigned int,		cookie		)
 		    __field(enum netfs_write_trace,	what		)
 		    __field(unsigned long long,		start		)
-		    __field(size_t,			len		)
+		    __field(unsigned long long,		len		)
 			     ),
 
 	    TP_fast_assign(

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

