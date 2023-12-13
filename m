Return-Path: <linux-cachefs+bncBDLIXLMFVAERBRMZ46VQMGQE2TVLTCY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDDE811641
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:24:54 +0100 (CET)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-425d3ed72f5sf37541731cf.0
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:24:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481093; cv=pass;
        d=google.com; s=arc-20160816;
        b=1JWSp508iQ2gpb3FbPlB7QzhPHtZwgiy9BDLsz0ppecQj4JV9cLH6CH0BOSI18f+92
         NQ4ffo5RpBSLOmXDbN47O8RjruP2c9h+Z/sMx17Luz+wAZGpGuVWhOvzwg06S6Y1jQn1
         v+ZckpQcgAdbUuywpoAiIjKohxJyb+VJE4r+YkEkahHBw7LJqZPs+dI0ruYhNkoiJkQJ
         RvlzlqeW4VWTrBsdVQbnjB3tJaOGuU7Y7lV26SEpY5qu6I3E6DHnVlSgGZQydrGFF3Zf
         B+h63HGLhEOhYxYRm/MMQMM/XhQy6yDRlEljzZ5YCBN+SVmN6EWi0UXLp0126UhThEVi
         qGeA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=MKdWsoNtGg2e3ybdJbBgnIp7ZHQQwkcsOD1sgioUoiA=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=ZdS/QgFsxCxjB6yK5vzm/yHDPNWESzYGiem/umVQ1QXBXmLDvb8tKjeCpHKR2lRiYG
         16O94WHa6r+gVkbYyBA5ciIbcOnOc+zjTKRD4Adh3bSPI20scfXY+iz6qQC6zEai44YU
         sbt81aQURAa7U+0EbLUSMPSWVT1aBw8RQYF1NbrjiC8cKTKmhBHV3kgkXmc7GeoRoBz7
         OlD2wZQspVIWHvUW1OCf2Iyr4bUgUFscFr15Je+GMc/nagnuyDrBEmHX1AJZyKYyZxRh
         izsjeRTCKYEvlxpd0v039FhqwxmFKcHZ3p350mhOzkqWbR/JSoKr+4TsMREFiIJVJg0v
         Qn1Q==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481093; x=1703085893;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKdWsoNtGg2e3ybdJbBgnIp7ZHQQwkcsOD1sgioUoiA=;
        b=kTkApj6KWZxWoX9B0y8vkiyd4hyga2sGh7DqTFO8r3Wh47JHoTcuC9rPa8VMje+xCe
         0Iv2kz67MrfoBHewEFwwD6jX137l5tzJ7VPeN8qL+GGRn8d7XWcCygcL0CjTTrAm/Jik
         Mus3GCVIvXdtCglHiSmL2K2gOBUZnjBgh/p7oBv4kfqhXUlVMajqsJHNweUZze3Ht40i
         vsU7UQOYC5xMypB7/nhTGEBIiPngt65z5p9xXh980VGX9GgIa4/NmRljXXrHEAEVpMjK
         WehHBriMNSUiIGgx+P03BeYUMeFQ1QMyOvahnAMDO9qcUr2Ehl25meDz+5ctz4YyDvqj
         EhYA==
X-Gm-Message-State: AOJu0YzNf7+6FnwYT1uyKxy7zj4TlbYEWH9kMJICw0YwUVU34dN3+LTs
	PWCvK/3IFw2k8jHFwrlF+qCDog==
X-Google-Smtp-Source: AGHT+IGdhFX9Q9lAIN+ns6ja3CEAfJVmAHz+xnI2LGYWYTwztP+3wxJd+n2T7kIMYuK45+en2BmEiA==
X-Received: by 2002:ac8:5c0c:0:b0:423:e2f5:d16 with SMTP id i12-20020ac85c0c000000b00423e2f50d16mr12076899qti.3.1702481093315;
        Wed, 13 Dec 2023 07:24:53 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1aa4:b0:421:c71a:9295 with SMTP id
 s36-20020a05622a1aa400b00421c71a9295ls2235315qtc.0.-pod-prod-01-us; Wed, 13
 Dec 2023 07:24:52 -0800 (PST)
X-Received: by 2002:a05:622a:308:b0:425:4043:18a2 with SMTP id q8-20020a05622a030800b00425404318a2mr11648718qtw.85.1702481092749;
        Wed, 13 Dec 2023 07:24:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481092; cv=none;
        d=google.com; s=arc-20160816;
        b=CUY4Typ6+eF1e8fzvjTWjB/9anwm6UaTxI3G0LZxdFgDNobFM6pDydtQ4yyQ/L6HAJ
         M1sUd2p+bgBz3Oq2g6xmTR0HGIuDwjSN17ksExPWCHA/5eT+XZTghUltg0g8KvVflkoX
         B3SvUBShoJMI2GHmt4EwjE8EhCUl6d6DCnqHXVTX1HYuR2F5M8aQ5TNlAuP5brFoRXVw
         j9264E9DBWp95Mdot5u7cmEIEqsPTZI/enQR0GxwyhMyX0j7ewUTqOT/7dw0C5fq/PTf
         7uy+ovquOxevN3o3sE7Nr+kZ8YSXoQzhzZ9gIQarYqiYy3nntBWiYoUA25EJeMTp+JkW
         xqsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=R2/A7TiJV6TZ1k1DToK4IbKjyWB1JSrvz3z2/pRYZzc=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=hAZcbzor1FZF8jdR2zNfyifFbbwzxCI0kt19S9ZMDOQb6Kl8URYas7XJGA/DfiaWfI
         feJsH9Uj0lN8COd1LHaditUTqnHKC364P2PY/dJHF7Ya4hlRdVeTjtDREfx6hhBpxZdS
         Hc/T2rYGDI5SHgIUXYI7c7kIhMVJikDIkQt47Dx8RsnMIC6TuS3j7TCx4/IuoeTDxI9g
         dOvpGTmhw9xQVqu6982R4oO7E6mw4sGK29qaQ1ScTy9oYCKpEEtr+BxxmHYJSD6c6v+y
         2vbFglqf86PEwflICH38+O9czBG7Q01+OfDc7AfJkXKazr0OOKD604FUSJezooW7zQj5
         uRyw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id bz27-20020a05622a1e9b00b004257823159csi14690304qtb.660.2023.12.13.07.24.52
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:24:52 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-ERB2QhhnMRaVje_fysjjYg-1; Wed, 13 Dec 2023 10:24:51 -0500
X-MC-Unique: ERB2QhhnMRaVje_fysjjYg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10029185A787
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:24:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 0D69E112132A; Wed, 13 Dec 2023 15:24:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 035311121306;
	Wed, 13 Dec 2023 15:24:47 +0000 (UTC)
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
Subject: [PATCH v4 13/39] netfs: Add support for DIO buffering
Date: Wed, 13 Dec 2023 15:23:23 +0000
Message-ID: <20231213152350.431591-14-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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

