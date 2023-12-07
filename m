Return-Path: <linux-cachefs+bncBDLIXLMFVAERBM7PZCVQMGQE6U63L3Q@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mail.lfdr.de (Postfix) with ESMTPS id EF035809352
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:23:00 +0100 (CET)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-58dc2d926e7sf1558767eaf.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:23:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984180; cv=pass;
        d=google.com; s=arc-20160816;
        b=S8ShoVra4N+mWbtBf6HDXWGtvM7oF5vw13cnLCjQ3MtEU0FCS24lOHjtoIKbSa61Lw
         CrS6C+YVHBwpftcgu8Y3nHpqJsv1q7N4CM791Xg0RLDtsha7KySFfOFKN/RKAkTBPki6
         a7uhePoM8zvSD9WmEhbhZbYraAUJekJQk/rfhUjFzn6XeOAc9OGOwGSzOvVOiIeVyvL8
         XVE2wpS2X/7Z8Kms/ih9od3TiS6y4UebqI6kepJGnZJfdNrWPSg5eRwWa7b8W0RiEdOT
         K4lhGnYWKJkKuNXhw96hERxBxsWqSV4P4BWPJwk5ulHI1addGpCrzB5EkzPv/C6n7qH7
         nilQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=MKdWsoNtGg2e3ybdJbBgnIp7ZHQQwkcsOD1sgioUoiA=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=yDgUcf1tsY6VLFGRJKUWTGI3wRLzyEnpl2fWAnXmMV23fniLoOa5F0wKBM8UYdv/dA
         EICAk1/d1SzlBO4tGd2zSiMd4tH/PakLxlVZFpGcsdC+QBQk3JcDcJ/lggSuQ0jRsh8i
         5lWSVsLcF3E+5xOqc1EIJ/a7RcFX2+ngtGHP+hCIAAqANRkt+L3d3SMFGe5yJr98XNw+
         DQGs6hljXu7sTUEaY/UBCJmeQG6ORfXz9eZvfFaI15SBXBTjxC4PovAj9PmC9AgLKPe2
         ZPMvjEy8RtSbFepxWXROGQQNbzLcG1GQic5p/jW8qegJbnsOKFuBSgP8RkUx852jjiEH
         Ui1w==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984180; x=1702588980;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKdWsoNtGg2e3ybdJbBgnIp7ZHQQwkcsOD1sgioUoiA=;
        b=mR8dQ/3Xd6C++Kb0ZmtLC2W2yrYgmbPdi/7+IKJD5Eepz4IFtfI/fpP/lyRth7AVFI
         MMUXSfLzOJl9EzCDAMv+NTdHFJ4hpfh6En7lWwOLYa9Bkgv0TbSJLLt91RDfSVpNj8Bd
         A51rgYOgtXo4jiI1+0zgAYmbakzaaaJkweddZ4C9ZB7iBk/eYybj3GJOVdVyPXUdrjc4
         jSMybhW0IkjJ2abC7z+rUXaE9uTDT7gq3PnReEIZ0a0ugW9kdbWMFvWIusPMFgLkQDhB
         OITpo6aq4aNcAkrkNlusb94XL9MlJii8YDR95aYiOaQsZcp5XBVv/ibYMgFDtZ4qy+dX
         wEXw==
X-Gm-Message-State: AOJu0YyyHIh8zeuPQOpoXq4minxR4UNXxF6PRYVg7Hj+KuJMRbLJ2O9U
	wiBer71A5VqQLWJRaw+ejkzPTA==
X-Google-Smtp-Source: AGHT+IGPnw+7+zLrzpPMPmgvWVdBxXGlkg0ZVOQ+AF7x4d1ZK/sPH4atpKZlBC3jACcBFWkspnu6Mg==
X-Received: by 2002:a4a:dfba:0:b0:590:6b74:3bc3 with SMTP id k26-20020a4adfba000000b005906b743bc3mr1753334ook.2.1701984179799;
        Thu, 07 Dec 2023 13:22:59 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6820:1aca:b0:58d:5ec9:ea68 with SMTP id
 bu10-20020a0568201aca00b0058d5ec9ea68ls1962014oob.1.-pod-prod-07-us; Thu, 07
 Dec 2023 13:22:59 -0800 (PST)
X-Received: by 2002:a05:6830:4407:b0:6d8:74e2:a3ce with SMTP id q7-20020a056830440700b006d874e2a3cemr5476305otv.42.1701984179212;
        Thu, 07 Dec 2023 13:22:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984179; cv=none;
        d=google.com; s=arc-20160816;
        b=IxoOB/J/4mvPho5XYyvWBw0bbVMKs/NR9NGJfSrvDS4z0wmq21kFwf5aR19JYR04QJ
         SMql2x0x97iCF/7hpbqU+Mjl7sUSlsiFY1lgOjjTFvUIsDwY80XugzpCYCWomuZJAS9/
         ubbRl0BURu2B2JFxMBSJvr428Rq9AG0V5Zg8zA22xDeyFFyLEOg/UCJNfVtXnW1m3smC
         Q4p6/WSLNr4dlhsRl8RKS70wtzlJUrkauzqugLt+dMOzd9SPn7ZZLqyVrDSQmxb2Mxiw
         XzCYdyoLSV38QDBSaGmwQB4JiA6fP1dZXTlkkoa0zXubkkJZZ00RWqHVxllA4p3nRYdU
         jzQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=R2/A7TiJV6TZ1k1DToK4IbKjyWB1JSrvz3z2/pRYZzc=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=r7qKsMj83+4GH2evktPUH+EPRX/gGNAymZ7yg1HiK/l/w3cSfrKNzR5BjV8N5SouSr
         km4ZTKyGj1v7AtAoT1kr83VfmFpsYcA2F3LUFSgkLrYWNsuVP2uYMYeQVj9oAU25Zj9Z
         boX4GHQ+PTC0+bhhUXr/neVW630vz0YDmpj+Zne+SuHGhPc33c22T+gJ8B2Jg8b7c/rf
         /sDhtPxv/xCvWETCl6rgHwxvgWzhld5+jp+f1VTiopS/VkIdK/MrQbTnRFI//mzRtqjF
         EqDvH+yMboYo8tX7PkgeYaXcHkdJDNHGYDATKN4bDkV7NNXTC+Dd7Pl8jfcYQXOtiMtj
         fzDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id v31-20020a05622a189f00b0042374c4031csi738542qtc.391.2023.12.07.13.22.59
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:22:59 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-629-6ZRuVHzzP0qEgndogypQEA-1; Thu,
 07 Dec 2023 16:22:55 -0500
X-MC-Unique: 6ZRuVHzzP0qEgndogypQEA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FFBB3813BDD
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:22:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 598A43C36; Thu,  7 Dec 2023 21:22:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B245E3C32;
	Thu,  7 Dec 2023 21:22:52 +0000 (UTC)
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
Subject: [PATCH v3 13/59] netfs: Add support for DIO buffering
Date: Thu,  7 Dec 2023 21:21:20 +0000
Message-ID: <20231207212206.1379128-14-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
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

