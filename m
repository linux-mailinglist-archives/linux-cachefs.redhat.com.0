Return-Path: <linux-cachefs+bncBDLIXLMFVAERBVVB46VQMGQELDJQGSA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 247C881179F
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:42:15 +0100 (CET)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-67ab70c547fsf97213176d6.3
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:42:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702482134; cv=pass;
        d=google.com; s=arc-20160816;
        b=QPQK90v1uzw1fks7bTjFX48oLA/D601Ar3nXNZ3Zjwt9qtYmaJBD/Aj81XmZiwt/oh
         agPGnT1x+h7KoXHIr3bA6ggj+JChBXsiSnJAvkxXV2viVkrPvgUnDtcQ3j3t6w7x4vbh
         sX9dwojqvRRmN1CxNmmFOS34VKoPbkvNfkHXLxZb114JNa8Wem3I9OkpUYxtep5lmcg6
         T7TNSvDZ3ki8zZhlbFtd1p0XIfeuVoQh20hjYVrO8fTV2CA7HzdhZgGg5gzZ6YYQfsB6
         HePEnUkQOYbvwIHur8ZAZr8KoeQeVQ70iMnLt9g2Dy3uzqG7DzY8YfzQDyMKl3m3qGt7
         BvOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=TGdlKGUgLKIfqW41hGNXCOB9mBGEAWW+ppFOu1tsHq0=;
        fh=/d04rGhva23/oMvvc+i8J/J8+GzO8KYoVKSGWp4U6JE=;
        b=Ub0jkOT/HW1ayFL+Ckt8p5mVsZFWT2P5QbI4OYFvJ7trv2Ie9uV1cB19dGjm+LeyaW
         xNfjFJB3mBn6Q2+vf1ucDNWnHAtoClwpyz6InkzMnQst2cFGoa3GAKa4+oRwA50deNnu
         LcliIfyZx89gttA9J/fYHXHil6KbFDYxjocKDRaZONMuDR226HD6pMSfF9t0Fuvc0+Ml
         sSLJQwsF3TCEJ6bQOsxz03NeU096zcIve3zhwcj/S7WC70+D6UwSEUdkCse/oYCtgUNo
         t1np5CSDwjLNpVJfpREY/px4d75hLK2vdOATkmid6e1tzED6bjLilFpfwdn5HRqDwXSD
         N8ng==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702482134; x=1703086934;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGdlKGUgLKIfqW41hGNXCOB9mBGEAWW+ppFOu1tsHq0=;
        b=N4SdbcFIBn4rKClIEOCIOBJ76/zdFZB3S9k66fviobsINiCZl42KxyG3CHvvQqePB9
         ihyghFLXWp2BRluxeP1pIR9NU7ga/r6Nrtt07wYPy4VyAD7NwqBk6NMqgENawkywdDeM
         cPxDnW45hQHa+NsRS7y08g0rlRb3KudKh9ObLg1JH7u5MC1mo0e9TecaXDf0HzHsuS3d
         L9pgV8puXYSjCQsl4yfwecUffRB9iynA/dpEDxv8/bCbEK/6IQlaFDgjtpmTmSPXF8ci
         V/yZWmmCl1jZoRijA+OGihnjU1f1/P6qWadmCn0kp8xF6eJAVtwKyroyO9upamjh0gz3
         NeIA==
X-Gm-Message-State: AOJu0YxmEOQfxourz5bdckhY96Qt/yz2Gk5k91+A6CbqRU8+ZbqfM4Df
	1vVCQ3qn1WElnW2w862iFJdkvw==
X-Google-Smtp-Source: AGHT+IGkIwHgSbTmb/Fh0AvVpe6/kShBGSzzh+J3R8JVKm0Gh79UEPTvVlhUNDS1/BprWu1xkR1FXw==
X-Received: by 2002:ad4:510d:0:b0:67e:fc9e:edc3 with SMTP id g13-20020ad4510d000000b0067efc9eedc3mr725571qvp.63.1702482134160;
        Wed, 13 Dec 2023 07:42:14 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ad4:4b62:0:b0:67a:94b0:82e3 with SMTP id m2-20020ad44b62000000b0067a94b082e3ls1945918qvx.0.-pod-prod-07-us;
 Wed, 13 Dec 2023 07:42:13 -0800 (PST)
X-Received: by 2002:ad4:4f8f:0:b0:67e:f2c7:7dcb with SMTP id em15-20020ad44f8f000000b0067ef2c77dcbmr1857801qvb.84.1702482133609;
        Wed, 13 Dec 2023 07:42:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702482133; cv=none;
        d=google.com; s=arc-20160816;
        b=x2wo81cRyWMClQMY6Vu40n2afg4vU9CkhL/+rtiyEd1+VEPU7YjH/5ZgVy2yBuRXJV
         EdFdjqb3xaAdMUhUE73Rde7C3S3xHpSIOpkw/rO1jrnm5cJe1agTyvF6H6VJ/jS0C9nq
         3hM6Fps7E+QHxWbAqpnDBHRIdjmFMn/oVrfWd56z31HYePV/sAVAR6B6Qcjp7QAgMhcs
         c6RXTelz4XOwkA+3lcfq3Yk0O52vcmTBVApg/xbj8zbldmxLYuJ339SrjHrbGm2GfkPI
         Adgy1zugvcLygOTfxpp8ZZEyc7KGXT+Fo6w4mlVkf/a/SrFmJop8x0qyn64L7kGYbJgV
         5veA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=SX32VVlY+6AEELPcYZ8BCFGvdzXi6GFp9f1xT1yEEMU=;
        fh=/d04rGhva23/oMvvc+i8J/J8+GzO8KYoVKSGWp4U6JE=;
        b=I1wbmiTSROJcCuvOsKPPfNb8EwaSN3UGD8eRrpkXMzAqILwYepFmMk3QFfWWLu9YKs
         ibMmlt5RAjYy+SMmeZxt79ieSe00eHEU0eSbfvDsedOab1zfgjl+uJwfZfzA9Y9qobfY
         MEomoDsaB5ZkK2kovqW8RRewfL5eN5ltNEWZ8FbINNLPKzNIqNm6bqn3b/NWNvzjeIt+
         78A7aXdVh1/oHMUBpMrvDpNxbQB6gyYksPsX+wkBoBuXK9E+Ms8/wv7NZsSnJsC+oiAG
         7B6cJE6sFeJejtyqIuzUklt2QZbLTcIH5mIBfNlJiIMKzTdWbCbPQWPW5W2cr4YAGDOp
         Q+Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id m3-20020a0cbf03000000b0067ee84abca1si3985250qvi.105.2023.12.13.07.42.13
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:42:13 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-n0Kpmo5dP1uzZn3IruGb9w-1; Wed, 13 Dec 2023 10:42:11 -0500
X-MC-Unique: n0Kpmo5dP1uzZn3IruGb9w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A12CA185A786
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:42:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 9E8ED3C30; Wed, 13 Dec 2023 15:42:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C492A3C25;
	Wed, 13 Dec 2023 15:42:08 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
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
	linux-kernel@vger.kernel.org,
	Steve French <sfrench@samba.org>,
	Shyam Prasad N <nspmangalore@gmail.com>,
	Rohith Surabattula <rohiths.msft@gmail.com>
Subject: [PATCH v4 07/13] cifs: Make wait_mtu_credits take size_t args
Date: Wed, 13 Dec 2023 15:41:33 +0000
Message-ID: <20231213154139.432922-8-dhowells@redhat.com>
In-Reply-To: <20231213154139.432922-1-dhowells@redhat.com>
References: <20231213154139.432922-1-dhowells@redhat.com>
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
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/smb/client/cifsglob.h  |  4 ++--
 fs/smb/client/cifsproto.h |  2 +-
 fs/smb/client/file.c      | 18 ++++++++++--------
 fs/smb/client/smb2ops.c   |  4 ++--
 fs/smb/client/transport.c |  4 ++--
 5 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
index 80a9f15828cc..a0d348b166c2 100644
--- a/fs/smb/client/cifsglob.h
+++ b/fs/smb/client/cifsglob.h
@@ -512,8 +512,8 @@ struct smb_version_operations {
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
index 47c352426fcf..85e115da8899 100644
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
index 16f6c15e0d06..b47abeefe628 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -2733,9 +2733,9 @@ static ssize_t cifs_write_back_from_locked_folio(struct address_space *mapping,
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
 
@@ -3247,7 +3247,7 @@ static int
 cifs_resend_wdata(struct cifs_io_subrequest *wdata, struct list_head *wdata_list,
 	struct cifs_aio_ctx *ctx)
 {
-	unsigned int wsize;
+	size_t wsize;
 	struct cifs_credits credits;
 	int rc;
 	struct TCP_Server_Info *server = wdata->server;
@@ -3381,7 +3381,8 @@ cifs_write_from_iter(loff_t fpos, size_t len, struct iov_iter *from,
 	do {
 		struct cifs_credits credits_on_stack;
 		struct cifs_credits *credits = &credits_on_stack;
-		unsigned int wsize, nsegs = 0;
+		unsigned int nsegs = 0;
+		size_t wsize;
 
 		if (signal_pending(current)) {
 			rc = -EINTR;
@@ -3818,7 +3819,7 @@ static int cifs_resend_rdata(struct cifs_io_subrequest *rdata,
 			struct list_head *rdata_list,
 			struct cifs_aio_ctx *ctx)
 {
-	unsigned int rsize;
+	size_t rsize;
 	struct cifs_credits credits;
 	int rc;
 	struct TCP_Server_Info *server;
@@ -3892,10 +3893,10 @@ cifs_send_async_read(loff_t fpos, size_t len, struct cifsFileInfo *open_file,
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
@@ -4491,12 +4492,13 @@ static void cifs_readahead(struct readahead_control *ractl)
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
index b2999933a449..353218a48c17 100644
--- a/fs/smb/client/smb2ops.c
+++ b/fs/smb/client/smb2ops.c
@@ -216,8 +216,8 @@ smb2_get_credits(struct mid_q_entry *mid)
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
index 3048516573e8..5cf653463c55 100644
--- a/fs/smb/client/transport.c
+++ b/fs/smb/client/transport.c
@@ -684,8 +684,8 @@ wait_for_compound_request(struct TCP_Server_Info *server, int num,
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

