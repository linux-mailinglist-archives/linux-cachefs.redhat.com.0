Return-Path: <linux-cachefs+bncBDLIXLMFVAERBMPZSCWAMGQEJJK7MOY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB3381B760
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:25:06 +0100 (CET)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-67f84b114c7sf6208456d6.2
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:25:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165105; cv=pass;
        d=google.com; s=arc-20160816;
        b=QL/CfWR201pYQrzcKeUiuxgOcY3yG2/0V1xqLZ40jLqXeyVTGsZfJBOg6cAtoDC0uS
         pSBe+jwE6uHVUR8JnPWm5+O7e11HVl15lovehtE9XXuCBF8wIxlXr7LKE5tc3G0Z9dSM
         kQFsuxWcbSQnuedqhk7dawxQJz1mhAb6sZk2YSmvDDdV+Jb42YC+oadG+QKc/q4ABj0O
         xbTJ3d4nyKdQ/0YbizjzcdPQwtV7N0sypt/R3O1JywPyHLCBdphG+O8tA8B4dGAlb4Dg
         jcWBMmrCzPLU02EQtyKMFsgo2J+u5euZ3snFD+9miQIu9TZq3cT3pgv/Wc9duKgw4ngu
         mb5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=dYfHezMgRwatDjY6QPlbk7lnHrMakv1awnEfLRgslJI=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=LLnywohaMezbMJuv/ZZ125XYNI0qR87bM4d/V2OWDR3lkCHdTBiCsnEaJfuQTnzxZt
         zuMl2lvmloirH+i8adE56l2eqCuGFU4So2Fk53rudmx0LbpdUr4MretbhDVCbDFlT8Km
         Ok0UtNykQfD5GvswNEWtQaPXxXIS3RKqRHyxR0L/bf7j4mjgLaN7rLNzUT4GVTNEVMeM
         hKdMhLKGRZJyGcVbRI/qR3gmXFcgJhMn/jJv24YF5GmNajmuHVfTkxORelhJnYbJZ7hq
         UsNfqtnSD/1EixQb7qyuxqUrtNSPFmhOEmqoksrGu+LsT5S+NrH8Y17v9OEa8eH7uZYr
         6KjQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165105; x=1703769905;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYfHezMgRwatDjY6QPlbk7lnHrMakv1awnEfLRgslJI=;
        b=OYVN5l4Giw81b5RIvhaLpiTP7Pk47/ELPsQUxSdFFoKt5JySo/2ZSysS3C1qQLZ8dx
         LKRCmdI5Pr+kBLBEbgWktsN+xnoezpM0rBjV1UEmAR/3LUvSRwEmy0nnY7PMcHr7ZJsF
         +f9LwFjeB6KRYh2K7pxE283TzQw9/ec1hK35HY78Sj1Z6Mk5OaKMT96DCWYFS2cLkW7H
         AhY+eA15F2WWKSXUQoh/ymWXJozlkbCGlSW2DB5RMfqSc0xFAA1Oc3jXd1S8ASFivBJw
         r+2rAc4a5YCCSn90WRLkDhPBRHOUAK9IewHlf6hBqoWSMy6mPDKWIuFueQyY+JWxL16N
         0alw==
X-Gm-Message-State: AOJu0YwWr9vndfQbD6V/iPVDNhtSYHKRPVIYFWppw5dWOnKXDPwyB9yA
	bjrwoMo1N8e4S7fWQDSvfyzvIg==
X-Google-Smtp-Source: AGHT+IFk51ZcL5AqIVJ103eNivsB7ZHf4ZnwJgW1fY7Qhy244quyjXKJziDKeTyPlKRcWqU/nS8TdA==
X-Received: by 2002:a0c:d848:0:b0:67a:b71d:4d8f with SMTP id i8-20020a0cd848000000b0067ab71d4d8fmr18693146qvj.31.1703165105475;
        Thu, 21 Dec 2023 05:25:05 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:ac3:b0:67a:1a58:78fc with SMTP id
 g3-20020a0562140ac300b0067a1a5878fcls1442091qvi.1.-pod-prod-07-us; Thu, 21
 Dec 2023 05:25:05 -0800 (PST)
X-Received: by 2002:a05:620a:1219:b0:77f:60df:4373 with SMTP id u25-20020a05620a121900b0077f60df4373mr25544031qkj.4.1703165104942;
        Thu, 21 Dec 2023 05:25:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165104; cv=none;
        d=google.com; s=arc-20160816;
        b=b/a8hLsvBjjrNgAEr1Xsy2r163QfXxIah57cjPzQLEgvc799Wi616vxTYZiSNmErro
         XYR2vI7NRAqjiPINGkPyZ/7rqA+F1UpNZ9YJ1J/RL3JolgcuDmDCz/64Ajj9PfKK1GMc
         HIgXawsABar/1x8P0BVpSc21UPqTp78RqWmTXuoy8jEutmIHi+QKxm4blqXWbBu+2nPS
         9HTKjwn6ry8ytmyrSeyKNyFbj7t2vv4oAwyGEk6K0Fq90ukLPnrW8Cydz0sxc8GGOoAZ
         BO3WJthwY66FZ7d/bCP0BuWYPriFc2Q5s/w44WV8rgks1g7afEl1N7tvnyKlzK4BgbMP
         iFnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=lld2cTcpcS4VknVAxRos+fui6lNRTW6LKGLR14kA3iw=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=X5y5SYYIz9UHKiLju2PftX15MCWC+Y40erFwYNcSXYXsoJxK729OKKufJfSYDhtqu0
         jo+kj/79g4CpkNS6Xn2RUaFiik2wqc/PPd2Rd+qyQHTharaGSp1PxT1nQfr+RyDxl6+E
         YSlhxZVkUOus1BURlpjAxAu2nfs6FkO2x5xewnLYghiGuTPZR2UwcXvgGl+DFYRoAoET
         2bEUkj3vmqSB0D4cEc0V4jXhywuVoI0OFwdtReYlEloyDzEwHHRTcUHiTc7swgtCHvqZ
         mAzuVWVsgSHD4A5C+0p6Kg/cowUglhidr3Fwa9/qdg3IzKj5K2nijnVTT1kKcJb8dDkz
         EG7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id k1-20020a05620a414100b007759f9416easi2170124qko.635.2023.12.21.05.25.04
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:25:04 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-6jZQQC1mMIiLcm0W93J76w-1; Thu, 21 Dec 2023 08:25:03 -0500
X-MC-Unique: 6jZQQC1mMIiLcm0W93J76w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BB3B85A588
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:25:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 06A431121337; Thu, 21 Dec 2023 13:25:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DF4B61121313;
	Thu, 21 Dec 2023 13:24:59 +0000 (UTC)
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
Subject: [PATCH v5 15/40] netfs: Add support for DIO buffering
Date: Thu, 21 Dec 2023 13:23:10 +0000
Message-ID: <20231221132400.1601991-16-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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

Add a bvec array pointer and an iterator to netfs_io_request for either
holding a copy of a DIO iterator or a list of all the bits of buffer
pointed to by a DIO iterator.

There are two problems:  Firstly, if an iovec-class iov_iter is passed to
->read_iter() or ->write_iter(), this cannot be passed directly to
kernel_sendmsg() or kernel_recvmsg() as that may cause locking recursion if
a fault is generated, so we need to keep track of the pages involved
separately.

Secondly, if the I/O is asynchronous, we must copy the iov_iter describing
the buffer before returning to the caller as it may be immediately
deallocated.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/objects.c    | 10 ++++++++++
 include/linux/netfs.h |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index 1bd20bdad983..4df5e5eeada6 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -76,6 +76,7 @@ static void netfs_free_request(struct work_struct *work)
 {
 	struct netfs_io_request *rreq =
 		container_of(work, struct netfs_io_request, work);
+	unsigned int i;
 
 	trace_netfs_rreq(rreq, netfs_rreq_trace_free);
 	netfs_proc_del_rreq(rreq);
@@ -84,6 +85,15 @@ static void netfs_free_request(struct work_struct *work)
 		rreq->netfs_ops->free_request(rreq);
 	if (rreq->cache_resources.ops)
 		rreq->cache_resources.ops->end_operation(&rreq->cache_resources);
+	if (rreq->direct_bv) {
+		for (i = 0; i < rreq->direct_bv_count; i++) {
+			if (rreq->direct_bv[i].bv_page) {
+				if (rreq->direct_bv_unpin)
+					unpin_user_page(rreq->direct_bv[i].bv_page);
+			}
+		}
+		kvfree(rreq->direct_bv);
+	}
 	kfree_rcu(rreq, rcu);
 	netfs_stat_d(&netfs_n_rh_rreq);
 }
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 3da962e977f5..bbb33ccbf719 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -190,6 +190,9 @@ struct netfs_io_request {
 	struct iov_iter		iter;		/* Unencrypted-side iterator */
 	struct iov_iter		io_iter;	/* I/O (Encrypted-side) iterator */
 	void			*netfs_priv;	/* Private data for the netfs */
+	struct bio_vec		*direct_bv	/* DIO buffer list (when handling iovec-iter) */
+	__counted_by(direct_bv_count);
+	unsigned int		direct_bv_count; /* Number of elements in direct_bv[] */
 	unsigned int		debug_id;
 	atomic_t		nr_outstanding;	/* Number of ops in progress */
 	atomic_t		nr_copy_ops;	/* Number of copy-to-cache ops in progress */
@@ -197,6 +200,7 @@ struct netfs_io_request {
 	size_t			len;		/* Length of the request */
 	short			error;		/* 0 or error that occurred */
 	enum netfs_io_origin	origin;		/* Origin of the request */
+	bool			direct_bv_unpin; /* T if direct_bv[] must be unpinned */
 	loff_t			i_size;		/* Size of the file */
 	loff_t			start;		/* Start position */
 	pgoff_t			no_unlock_folio; /* Don't unlock this folio after read */

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

