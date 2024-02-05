Return-Path: <linux-cachefs+bncBDLIXLMFVAERB26PQWXAMGQE4Q4NKJA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F6684A9A8
	for <lists+linux-cachefs@lfdr.de>; Mon,  5 Feb 2024 23:57:48 +0100 (CET)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-42c33d3601csf1978651cf.1
        for <lists+linux-cachefs@lfdr.de>; Mon, 05 Feb 2024 14:57:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1707173867; cv=pass;
        d=google.com; s=arc-20160816;
        b=RlCaY3pTt/Ub1tb9d05J2du5kg0dNR6kwfMVX/GyC3H0tccqbaQmH1+auC4+1TidBX
         +HtjHPWOZ2eyZJmAEcSkwVF/mkkM4c8ehmXTBpdx9+pCRneE44IR6bC04CMdYkQwDMda
         3eTlx/rwgTUVrNPvEcZG6sVM5pNFPSIXMV08lS29iXgxsCU/M5mRwqogQL39EDAnWJnF
         pATnvx3sEhSMbIFKMHG8hEGcn2zRNzIadt7LYddw9gptK1hOXQSXG3pwM1LEedWzqwGd
         8dM8fGRUOQd4g6U2ZYIlX9DOZ6gO6kV9P9iPYU/o+Ndk3YsSH7GFzbSw0aRCX99TMVfI
         NweA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=HLritEYTt6DiaW8iAJQ8me74dL/oEzmgXbWyK9jNs90=;
        fh=4azttMD+4drcoGH9XHVIIEDqfd3nR4tyxvaT0JhOIks=;
        b=yi90ipGhEvtZQSbrTMlFzhHDr1/RgTKkyYwdod/8cS79lfENmPL4Io3O6DZaq5teBM
         ZESwPUKAbMjNHvqD8nAQRkGkTjA+fjdG8E4qCP0RIhnvCYJSKmJnLwkIw4LYi+kRaiDa
         /yR2+DDZaoEkB2j3+hCfb0Zd9eehEBTBID1WhJeP85IB57h+bHPIriU3j95ZOLxTjJXf
         MnaDyps8gCWL+gN/5HdBBAUJCtKDBADpLtnvcsnlrIUyIK4rmhU4Bi5EvvC3z8EM1Kms
         V4MvdpWttEMD7Lyk8acu5/KMc9+Spvh0CcYIW1IdQ13QomTrpkJlWyKQ6d1mDuveWUVu
         HaiA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707173867; x=1707778667;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLritEYTt6DiaW8iAJQ8me74dL/oEzmgXbWyK9jNs90=;
        b=u/O1AyHfi/lRWY0MHgCe+VRhiFX5waxjwZBH7h5NuNU5EEp90zrgXyDxWLOYMWM1TF
         4jx3+eaQL+ubOw0RZTh8nMvqiGnF0aSpiI1YngqJpTt+iHy8a65QiahVnq4JEw30+aCa
         YEAhwMS7RU2nm10z+aZzGdmZGycxfDJRF9VMwLuZz3Wm0EgJzTBRbUkzBVU8T8rrt4xb
         fJwV0ngiGQJIm5RhBrwR72ou0rOaQsiJWzvsQ+1iditSgLNKZzkliyQ/0DlRd1Q5M5N1
         Q5y8RFVA5shCPkDCxHYbyFIXhk0jcYWdY3oJe8fCoPC+Z0GTvAahx7m0QTP0HpDQr3rK
         kDfg==
X-Gm-Message-State: AOJu0YxicjAR1rEnXOc7dYrqIt557MTRIJEKPCN3btYT1cZUCUSy40yQ
	q2Wynup5ILJLJ6tHP6hP4gU/ttbhbCCht5hubmPb6/OMWq5tr1HP8HtOuI9moKU=
X-Google-Smtp-Source: AGHT+IF6Pk48P7fCNkoBsryz+hEgy0Th+61VFCtsphRlqO9Aq9TsyHlvcGsZuC/a9ChjU3RgzWWj2w==
X-Received: by 2002:ac8:43c2:0:b0:42c:27d3:d583 with SMTP id w2-20020ac843c2000000b0042c27d3d583mr645625qtn.20.1707173867446;
        Mon, 05 Feb 2024 14:57:47 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:8f:b0:42c:23c7:6544 with SMTP id
 o15-20020a05622a008f00b0042c23c76544ls444035qtw.2.-pod-prod-09-us; Mon, 05
 Feb 2024 14:57:46 -0800 (PST)
X-Received: by 2002:ac8:59cf:0:b0:42b:fd4a:e13d with SMTP id f15-20020ac859cf000000b0042bfd4ae13dmr710206qtf.55.1707173866706;
        Mon, 05 Feb 2024 14:57:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707173866; cv=none;
        d=google.com; s=arc-20160816;
        b=B5Kaz0OSmfU/qAJjkJ9zRKxx2A+iHAxJzUrH468rK0PAfkrhmhdBbK6CLaYIv8ksea
         xSaL4r1gFQS6e7bUh6FzCmhn8RgrswhuaLi3Q96sjj8c27FBGm6F72vQYWuixTgJAJlT
         yjaXZsnx7Eww4tTpTN1JCyIyJ53NPDDM73rl7jsXk8OY+xOpODGzgXT6w4pfjk9oyL7J
         D/VbezuBJtqIHSyUiCJka4jLRPM2POOu/ywr3I0qbQkUc52FsCIoeV/c8+LHmTXLErzg
         tlBkHIKT8mxV3cOTV0ZVe6XPl6lZr2QA93WZ61qD/kbhvke3YRPs3alIxN7q4PB8FZ5b
         70aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=rsfhF+v4jP24sud3ne/FJVWtqEteLzbJn5JlLIWDz9E=;
        fh=4azttMD+4drcoGH9XHVIIEDqfd3nR4tyxvaT0JhOIks=;
        b=fAoJvUQh3vs9l9flQEkbFiupwDzyRr437Fe+7BshcFSjk3wCbJZzn4Yrp1V7NqO4ct
         sUJqPJ8mflYFSZPCbKo5MQ2Tz5xPKIvB2tvN43xcBmkMAc4MnwBceiOkakPDODkjbVq8
         AS6ZGRuGzSDrHaMVy4CfdV4hP5vutpAP1DTFk4raUfvATlfT9hCCQT8Ox0AWEgwwqu/n
         d2bzxwxVlmTR6IAhc+2zwrVyY3wEQ5woDGSVa5gFN3ZPh0UEhGgDLdUdRdB3elo9uONP
         LDaVr8TA6jGloHYgX+l05SGZnIOXFGIwzxUQKXSIPxwHT8XC9UpTiPq2vF9TZS7qSUzM
         Omsw==;
        darn=gapps.redhat.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Forwarded-Encrypted: i=0; AJvYcCXXkLKeqS31Sce2hBAsVrB4Hi9rvrYteGTlLcyDcxQY1x4JsdLM+bOoC3CatUI2smWpJ07Jla5hKI1ksXUYoojA5gLGi2WIIIdZdU/GuCA=
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id x15-20020ac85f0f000000b0042bef62ac03si972396qta.432.2024.02.05.14.57.46
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 14:57:46 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-rSL_FROBMtiVUUZ2sSnSnQ-1; Mon, 05 Feb 2024 17:57:45 -0500
X-MC-Unique: rSL_FROBMtiVUUZ2sSnSnQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8CBD85A58B
	for <linux-cachefs@gapps.redhat.com>; Mon,  5 Feb 2024 22:57:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id C3BF01B92; Mon,  5 Feb 2024 22:57:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B02C13C2E;
	Mon,  5 Feb 2024 22:57:42 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Jeff Layton <jlayton@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Christian Brauner <christian@brauner.io>,
	netfs@lists.linux.dev,
	linux-cifs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Steve French <sfrench@samba.org>,
	Shyam Prasad N <nspmangalore@gmail.com>,
	Rohith Surabattula <rohiths.msft@gmail.com>,
	linux-cachefs@redhat.com
Subject: [PATCH v5 05/12] cifs: Make wait_mtu_credits take size_t args
Date: Mon,  5 Feb 2024 22:57:17 +0000
Message-ID: <20240205225726.3104808-6-dhowells@redhat.com>
In-Reply-To: <20240205225726.3104808-1-dhowells@redhat.com>
References: <20240205225726.3104808-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
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

Make the wait_mtu_credits functions use size_t for the size and num
arguments rather than unsigned int as netfslib uses size_t/ssize_t for
arguments and return values to allow for extra capacity.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: Rohith Surabattula <rohiths.msft@gmail.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cifs@vger.kernel.org
cc: linux-cachefs@redhat.com
cc: netfs@lists.linux.dev
cc: linux-mm@kvack.org
---
 fs/smb/client/cifsglob.h  |  4 ++--
 fs/smb/client/cifsproto.h |  2 +-
 fs/smb/client/file.c      | 18 ++++++++++--------
 fs/smb/client/smb2ops.c   |  4 ++--
 fs/smb/client/transport.c |  4 ++--
 5 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
index cac10f8e17e4..c0a0de24f52a 100644
--- a/fs/smb/client/cifsglob.h
+++ b/fs/smb/client/cifsglob.h
@@ -530,8 +530,8 @@ struct smb_version_operations {
 	/* writepages retry size */
 	unsigned int (*wp_retry_size)(struct inode *);
 	/* get mtu credits */
-	int (*wait_mtu_credits)(struct TCP_Server_Info *, unsigned int,
-				unsigned int *, struct cifs_credits *);
+	int (*wait_mtu_credits)(struct TCP_Server_Info *, size_t,
+				size_t *, struct cifs_credits *);
 	/* adjust previously taken mtu credits to request size */
 	int (*adjust_credits)(struct TCP_Server_Info *server,
 			      struct cifs_credits *credits,
diff --git a/fs/smb/client/cifsproto.h b/fs/smb/client/cifsproto.h
index 867077be859c..00cb0d2dc935 100644
--- a/fs/smb/client/cifsproto.h
+++ b/fs/smb/client/cifsproto.h
@@ -121,7 +121,7 @@ extern struct mid_q_entry *cifs_setup_async_request(struct TCP_Server_Info *,
 extern int cifs_check_receive(struct mid_q_entry *mid,
 			struct TCP_Server_Info *server, bool log_error);
 extern int cifs_wait_mtu_credits(struct TCP_Server_Info *server,
-				 unsigned int size, unsigned int *num,
+				 size_t size, size_t *num,
 				 struct cifs_credits *credits);
 extern int SendReceive2(const unsigned int /* xid */ , struct cifs_ses *,
 			struct kvec *, int /* nvec to send */,
diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
index 6e53657154d6..63237dad0c4d 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -2735,9 +2735,9 @@ static ssize_t cifs_write_back_from_locked_folio(struct address_space *mapping,
 	struct cifs_credits credits_on_stack;
 	struct cifs_credits *credits = &credits_on_stack;
 	struct cifsFileInfo *cfile = NULL;
-	unsigned int xid, wsize, len;
+	unsigned int xid, len;
 	loff_t i_size = i_size_read(inode);
-	size_t max_len;
+	size_t max_len, wsize;
 	long count = wbc->nr_to_write;
 	int rc;
 
@@ -3249,7 +3249,7 @@ static int
 cifs_resend_wdata(struct cifs_io_subrequest *wdata, struct list_head *wdata_list,
 	struct cifs_aio_ctx *ctx)
 {
-	unsigned int wsize;
+	size_t wsize;
 	struct cifs_credits credits;
 	int rc;
 	struct TCP_Server_Info *server = wdata->server;
@@ -3384,7 +3384,8 @@ cifs_write_from_iter(loff_t fpos, size_t len, struct iov_iter *from,
 	do {
 		struct cifs_credits credits_on_stack;
 		struct cifs_credits *credits = &credits_on_stack;
-		unsigned int wsize, nsegs = 0;
+		unsigned int nsegs = 0;
+		size_t wsize;
 
 		if (signal_pending(current)) {
 			rc = -EINTR;
@@ -3821,7 +3822,7 @@ static int cifs_resend_rdata(struct cifs_io_subrequest *rdata,
 			struct list_head *rdata_list,
 			struct cifs_aio_ctx *ctx)
 {
-	unsigned int rsize;
+	size_t rsize;
 	struct cifs_credits credits;
 	int rc;
 	struct TCP_Server_Info *server;
@@ -3895,10 +3896,10 @@ cifs_send_async_read(loff_t fpos, size_t len, struct cifsFileInfo *open_file,
 		     struct cifs_aio_ctx *ctx)
 {
 	struct cifs_io_subrequest *rdata;
-	unsigned int rsize, nsegs, max_segs = INT_MAX;
+	unsigned int nsegs, max_segs = INT_MAX;
 	struct cifs_credits credits_on_stack;
 	struct cifs_credits *credits = &credits_on_stack;
-	size_t cur_len, max_len;
+	size_t cur_len, max_len, rsize;
 	int rc;
 	pid_t pid;
 	struct TCP_Server_Info *server;
@@ -4494,12 +4495,13 @@ static void cifs_readahead(struct readahead_control *ractl)
 	 * Chop the readahead request up into rsize-sized read requests.
 	 */
 	while ((nr_pages = ra_pages)) {
-		unsigned int i, rsize;
+		unsigned int i;
 		struct cifs_io_subrequest *rdata;
 		struct cifs_credits credits_on_stack;
 		struct cifs_credits *credits = &credits_on_stack;
 		struct folio *folio;
 		pgoff_t fsize;
+		size_t rsize;
 
 		/*
 		 * Find out if we have anything cached in the range of
diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
index 8d674aef8dd9..b79b6bbd7103 100644
--- a/fs/smb/client/smb2ops.c
+++ b/fs/smb/client/smb2ops.c
@@ -217,8 +217,8 @@ smb2_get_credits(struct mid_q_entry *mid)
 }
 
 static int
-smb2_wait_mtu_credits(struct TCP_Server_Info *server, unsigned int size,
-		      unsigned int *num, struct cifs_credits *credits)
+smb2_wait_mtu_credits(struct TCP_Server_Info *server, size_t size,
+		      size_t *num, struct cifs_credits *credits)
 {
 	int rc = 0;
 	unsigned int scredits, in_flight;
diff --git a/fs/smb/client/transport.c b/fs/smb/client/transport.c
index e52967de59e6..5a69a7430ffa 100644
--- a/fs/smb/client/transport.c
+++ b/fs/smb/client/transport.c
@@ -691,8 +691,8 @@ wait_for_compound_request(struct TCP_Server_Info *server, int num,
 }
 
 int
-cifs_wait_mtu_credits(struct TCP_Server_Info *server, unsigned int size,
-		      unsigned int *num, struct cifs_credits *credits)
+cifs_wait_mtu_credits(struct TCP_Server_Info *server, size_t size,
+		      size_t *num, struct cifs_credits *credits)
 {
 	*num = size;
 	credits->value = 0;

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

