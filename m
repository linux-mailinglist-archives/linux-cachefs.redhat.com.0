Return-Path: <linux-cachefs+bncBDLIXLMFVAERBPNQ36VAMGQEGPUCNEA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mail.lfdr.de (Postfix) with ESMTPS id 801C37EF97F
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:16:46 +0100 (CET)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-66d7b90c8ecsf29187896d6.3
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:16:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255805; cv=pass;
        d=google.com; s=arc-20160816;
        b=sqkixWZ/67AW8J8IVUVgJggPx9i2L3POukRnVVchnuTkYMpIuU6kZX+78v/tVZqtJw
         6S/tybtl5M82/NjvNY+vfIqPJNzpTgbeTzdcMpADOA6pC68AFTJZRyuQYSnmzcDvmM5d
         qTqkutPY6SdptOIoqeLB2Egu03UK/mBSHYb6ZlHh5QRK7ZO8r8N9FeCak3t/dwcWl94L
         O3j7NDQlqJ/o0gErViNikWqtDmJvlRvs+qbf2ddcipKeKLutGxYFwqVtvra1IxLX9SjP
         q5TV5lvp6r78VCcvcZhB7J5xRmq3bhSWX4DcWkyTBaF39NmQryUVvI6TvU4eV6N1DB8j
         qC/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=iV1bZQPfrtrISC037pLix1Q8aOfyGL+iE/rNZD/NDd8=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=qiEec2Seop0uODyIQIyNsNBtpr4ZqghZRPzhItDUMCFGtQflqXKpG8MARaXIp9TfbZ
         n1tQvN+3hZyVmqnXc0tBjevd+ZHJJgXzJ4kotLXazsBqQTzZOkFAHZF7cM4q3j3l0dae
         EpoN+tQhU5GSdD8BiiuBOwzuWVFCkqBOD1qHtXUFGloQ9nJQhjTY27fZNyU9qUMOrXGp
         X/gGtmiGxbvj56WP8Vp+12ifz0rKwp5JXgnjx9R6pB82tZgNp+pIlHf6/SyyD2RcimRE
         TrwZzurpgMJ6nBdtKTSmO0VopxnND69EOBuKHo4PV+1wYkyvBO3hl5YrIqoQh95ap3wQ
         XteA==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255805; x=1700860605;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iV1bZQPfrtrISC037pLix1Q8aOfyGL+iE/rNZD/NDd8=;
        b=Ewwu18bPzva9nVuAZHwJR84Re28k4gpyjUIF5dywq/AHXxpkmgCw1Dujid8eJTgKdt
         pHHFr30qS1StpP9KEO/Cukp+kRiFeYCDnfoJUipTgVNHL4wL1B6clDR86jJXBLvDx/Q6
         HRreVEMfAN580/8d4+gq/7AcgaoTJftz4qvJkXIAf/e/eELKE5nRj88sZ1zO9nhRu4oR
         NTiNHKorHSI4TeihMVhR6TS0oSFyrQGoTSyONj5zv4CfDWMRdN8u28eAk8ZEMyifk0nU
         sgm4u9a2bAgKfNdGF65ceHDQXxC6Ilxar316n5+q75Y5eKwu598NWjxCs9Fae8by7LD/
         ZWnA==
X-Gm-Message-State: AOJu0YzSgUfMJGM79j14MOJj8wsgGG5iIXTq5eUEl3PeiCnd3AI/h31l
	CiZz4ccsr2aOqkPQv5aoX77wTg==
X-Google-Smtp-Source: AGHT+IGf5jnahENmV62jCjPI3Ec+UM0AKF77rqhxKQ2fKOp81ppafaWIx3qUvi5dG8a1oPb6lldHJw==
X-Received: by 2002:a05:6214:5008:b0:66d:5dd:26f6 with SMTP id jo8-20020a056214500800b0066d05dd26f6mr367275qvb.25.1700255805576;
        Fri, 17 Nov 2023 13:16:45 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:709:b0:65d:592:a279 with SMTP id
 c9-20020a056214070900b0065d0592a279ls1772082qvz.0.-pod-prod-04-us; Fri, 17
 Nov 2023 13:16:45 -0800 (PST)
X-Received: by 2002:a67:ecc6:0:b0:462:8a0c:f6ce with SMTP id i6-20020a67ecc6000000b004628a0cf6cemr691538vsp.3.1700255805059;
        Fri, 17 Nov 2023 13:16:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255805; cv=none;
        d=google.com; s=arc-20160816;
        b=kWil59mJPPGlof5lCU/voPS9MuMKTIoOOqHSm2fWhRU/EKU0ZeGuyOASgKizpyIKRY
         JdL1BRh/gcjy2yFlgDybkahACLDpZH74gnumsvx9EtPsX2cg+V9oNMsyP23A317uwCHN
         3niuQ3akeEdkJLHO2bgT06H0j4T9ahyPkHisT7hDQqU9I+Er1QhjFvLlpm3hcrOTxwl1
         iool5Lmi1c5t90ZVitJjRHeAm1MrT2Nhw36dxkve81cJnnJrtbH4iby6HPFsOwa5joMH
         /kXFxNOauymyhd6pixHpm3L40djeoH1cI+6Us1zOGDir2yxw5M0xqQmrhNcBpw511ZAr
         VlhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=/h/RtPpFFvVcBRZ5JrGbnLPxoOOyaaScpnNAYMwDAl8=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=L2x3FN5buaTdP6OTusgwRydayk1ySNDgUns4MJTyyMZrTgoXf7+UwSm9Cuwgkz+VaH
         GUryn6sfjKJt9OXuvUPi0WyquP84SR4jsTj0NX2Jg6XEUWDwLUw9kdrS/F2cUgKLg/HK
         E9aZRRWIqpoyPVCx970ornamSV6aTtcv3HJ7gBLLlNKxl0V15PTe3f21ssg7NfqYo5fi
         IyW2lNE9TGf0QqQzkcWjDtQgAs7gZVYUlx/Ot6hcXsOlBu23wwZ5acYEFf0WekjEb67A
         fDkCrQk1EA5PC15OZt10Q9G6IDzvXgDZUrybGG7ogmGuWW0UpoVN5gPOF6fb4nlGvzTn
         mmKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id g1-20020a67cf81000000b00460f5ec6891si682742vsm.406.2023.11.17.13.16.44
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:16:45 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-nbAqlTQLOJibXpHtaa506w-1; Fri, 17 Nov 2023 16:16:43 -0500
X-MC-Unique: nbAqlTQLOJibXpHtaa506w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35246811E86
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:16:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 327492026D66; Fri, 17 Nov 2023 21:16:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 929962026D4C;
	Fri, 17 Nov 2023 21:16:40 +0000 (UTC)
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
Subject: [PATCH v2 16/51] netfs: Add a hook to allow tell the netfs to update its i_size
Date: Fri, 17 Nov 2023 21:15:08 +0000
Message-ID: <20231117211544.1740466-17-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
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

Add a hook for netfslib's write helpers to call to tell the network
filesystem that it should update its i_size.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 include/linux/netfs.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 62b768260eda..21650db7da54 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -248,6 +248,7 @@ struct netfs_request_ops {
 	void (*free_subrequest)(struct netfs_io_subrequest *rreq);
 	int (*begin_cache_operation)(struct netfs_io_request *rreq);
 
+	/* Read request handling */
 	void (*expand_readahead)(struct netfs_io_request *rreq);
 	bool (*clamp_length)(struct netfs_io_subrequest *subreq);
 	void (*issue_read)(struct netfs_io_subrequest *subreq);
@@ -255,6 +256,9 @@ struct netfs_request_ops {
 	int (*check_write_begin)(struct file *file, loff_t pos, unsigned len,
 				 struct folio **foliop, void **_fsdata);
 	void (*done)(struct netfs_io_request *rreq);
+
+	/* Modification handling */
+	void (*update_i_size)(struct inode *inode, loff_t i_size);
 };
 
 /*

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

