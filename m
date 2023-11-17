Return-Path: <linux-cachefs+bncBDLIXLMFVAERBJVQ36VAMGQEYG7NV4I@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C21C7EF96A
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:16:23 +0100 (CET)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-421ad4ca88dsf25968171cf.1
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:16:23 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255782; cv=pass;
        d=google.com; s=arc-20160816;
        b=U6VYuaojvZsbZBXHkbll2IdcOmp3SX8IHXnOVuvqA+YtXPfO70Ud5rYwsZbKVD4YJh
         XPsChDg7AM4tWxxAQuEuGYxkZSQKp2v9vDGTerZWwvwURMpcp0era48r4ay7qpR7tGdq
         Rfjd+yTAlQOXqaieD6RNwFYZiO+JGF6xTsaVpCyCZJXHtTel1btpKQroRe6iuhtjax8z
         ZhW3K2t1SQldKV7g0CoU9F9dgiFLofNXYL2D4IVCy8ZX09v5HsaKduxYISoedEy1C9aW
         O5hmH0OrT3hlTKsv1pbrRY5c/8mSy3HvSgbI+MNapr1egWZ5/+l8p0+VVXCtGXoiZ5mk
         Mikg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=DYvYeChO8iFF9+oYjbzQbeEXXmurWNeAnKwbzmzscF8=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=Rc1MWUljajAGBtdOxvzYU6x/w+BjMdgRCTN25FUO73mGG53KHVO9rNk16h000bCoTI
         RHleR6c7LwSC4/+U/7tgFNnO2VsTxAcVvOY/GdtKXCfCd4tv29NAWdoWoGfH5dN+Lcrr
         cD3xHt/ahHqoeVhKr4mxYxhBrpox2dhOWvvSNk7oKt9UlZ+5SlBRouc8Io7bEH9sEzcl
         pdtpE+XFqwAvv15uKgd/+236RDs/Fw4TEHnEnty4RUdVkzlvB0ISJZjMVqjZmDSdq4Vc
         e6Jm+pj4ER47TYibSTrG2GkoeVWB/AhzoBLfrKAHY8xTQaxxX+Hbk5QhIBs/JDhuXGlB
         fsjQ==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.61 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255782; x=1700860582;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYvYeChO8iFF9+oYjbzQbeEXXmurWNeAnKwbzmzscF8=;
        b=wimDpQtzN2P9Pi0AZXME9Jw1/JsKidLoyuXtmVmAOEONW3piObEctD7iGdT99JfeKg
         qxBUTEUpu+/3r0uv1CkSEEbiCfyOdDaGWPbktulm0ugkGtlQU+PN27XyAh4nuN26CbsJ
         JuOF8KCW2jXbeuCjNTlwsuEsMcZAdOCQW6PlJCpfU6gK2alRLMKduZHJ9rCWIZ5VoXps
         lcpbguXBLBGlQnqsnG6S3cHowTvxsc6EEuoXsx2/Qi3qx8KFm2ot0uTXTFlWG5erHQ89
         VDoVMxSsHk/u2l8VUVhyxJzG5bpDY00vnVmdy7mzG+dzwc/tClpyT1Ov73QCBgdiIHBm
         1R2Q==
X-Gm-Message-State: AOJu0YzRqsidzgsuAR7uVjQEGpiwN7ScoVLKhx7PY3KvuBScRKGST6tF
	Wi1jUHbJiiJATQn19Z0gFY7BPA==
X-Google-Smtp-Source: AGHT+IHtRY52DOhwJzmSaUZcSoSdLZ/Yp2Dww2KSN/GjLFkDM3tiyM7VjjVctwfWhRseHp8TwYyyTQ==
X-Received: by 2002:a05:622a:1393:b0:412:395c:e794 with SMTP id o19-20020a05622a139300b00412395ce794mr1109700qtk.50.1700255782267;
        Fri, 17 Nov 2023 13:16:22 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:4184:b0:422:1bd:4708 with SMTP id
 cd4-20020a05622a418400b0042201bd4708ls1872811qtb.1.-pod-prod-01-us; Fri, 17
 Nov 2023 13:16:21 -0800 (PST)
X-Received: by 2002:a05:6102:284e:b0:45d:9bac:d899 with SMTP id az14-20020a056102284e00b0045d9bacd899mr761384vsb.16.1700255781757;
        Fri, 17 Nov 2023 13:16:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255781; cv=none;
        d=google.com; s=arc-20160816;
        b=mTzETiOZjOV99GqCEoQf8LN5EdpGnaaa6ATcB+VPVPd+p+gi6/IAI4W54BEihM0KLP
         ngFeJ/NHQnYNlud+Ri/epDV2LobVCGorJAnrSl66AZaavvwGauN3tuH9YoeaflF9NV4Q
         MWCryKPkkkiO/vvTKrncRdtOJW60HCZyJoe080i0W2SjTAijPuUNCZDhH55wpH2DQeFa
         DTjhv1zWJdx865pP/HZ2lTSxUCnOKUXK2TCNkJytbrlmzos3KrdPmSjQf2MKoBKmauwa
         Wq/Ceu876L12Bsq0j8aNSqvy0wWKsvmh3Fb0mddOPSRCMc//WGwwilaWtFYDZrEX+WGJ
         HSig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=bIcfdnuUCbQOOB+XHi4o+OLT8DZkVqX+ywLCC563uKQ=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=js+FWsWaRsxE8rK+Ug84fJMPyeH7I3NUIqm1wBAcEBhQOHsGZ9tdZDXdLcEnsQz+ZE
         Bfb/Qfz+iCmQspyYGgicwtwRm5hOWFCgdT1/RIDXTH5OTUtvryDbIfwXnkewyjAVWJ70
         xq3Z4ING4FjBDlE/lz07zahqLksKHCGqtZKyhfHAMOmgTc+MuHHuwNEVOyzYU3XvB8Jw
         13HiGdpkLa3MOXGRA9vC1hQcjScl+/kzCDDPtJztjMZfZ9zPvEyqKh7R3G7H6bgVw57y
         QuIrnocL4mQlNN2HC0PasJyUXNA1QWn26IKM6Y/jpze5Qby4jOHgDPgWmMJbB6OV/3Xj
         GKdA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.61 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id ho19-20020a056102397300b0045479276f70si606837vsb.195.2023.11.17.13.16.21
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:16:21 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.61 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-XXg40Ih_O5iFaDlXfvtJ3Q-1; Fri, 17 Nov 2023 16:16:20 -0500
X-MC-Unique: XXg40Ih_O5iFaDlXfvtJ3Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC7CF8527A5
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:16:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id B825F40C6EBD; Fri, 17 Nov 2023 21:16:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 220B540C6EB9;
	Fri, 17 Nov 2023 21:16:17 +0000 (UTC)
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
Subject: [PATCH v2 09/51] netfs: Add support for DIO buffering
Date: Fri, 17 Nov 2023 21:15:01 +0000
Message-ID: <20231117211544.1740466-10-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 205.139.110.61 as internal address) smtp.mailfrom=dhowells@redhat.com
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
cc: Jeff Layton <jlayton@kernel.org>
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
index 48868b3e4d51..6d820a860052 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -192,6 +192,9 @@ struct netfs_io_request {
 	struct iov_iter		iter;		/* Unencrypted-side iterator */
 	struct iov_iter		io_iter;	/* I/O (Encrypted-side) iterator */
 	void			*netfs_priv;	/* Private data for the netfs */
+	struct bio_vec		*direct_bv	/* DIO buffer list (when handling iovec-iter) */
+	__counted_by(direct_bv_count);
+	unsigned int		direct_bv_count; /* Number of elements in direct_bv[] */
 	unsigned int		debug_id;
 	atomic_t		nr_outstanding;	/* Number of ops in progress */
 	atomic_t		nr_copy_ops;	/* Number of copy-to-cache ops in progress */
@@ -199,6 +202,7 @@ struct netfs_io_request {
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

