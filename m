Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 107A06184D8
	for <lists+linux-cachefs@lfdr.de>; Thu,  3 Nov 2022 17:38:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667493517;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZIO0ZMzDE6VaF83H6XDIUlflrQBXUugmMv1JukAKY8c=;
	b=Q8XG/m08mfStNQ2Qzfno3RD4x3enZW52Y0J4KBxJ/ADPQ+5tXfBJ0pv8PKQWHs+t8F9DLf
	eoEb0bgy5G9WGiU4Coi225RIyG2jzaFmja8tebi+tr9QcbPEpYj/59tzwLAEMPiGp7efsG
	e1cuIGsdIqBs5LL3JnGAReuFA/zREnc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-FVRlIRhqOe-VY_6uCtEF0Q-1; Thu, 03 Nov 2022 12:38:34 -0400
X-MC-Unique: FVRlIRhqOe-VY_6uCtEF0Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40B37800B23;
	Thu,  3 Nov 2022 16:38:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 375671401C21;
	Thu,  3 Nov 2022 16:38:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1B46D19465B2;
	Thu,  3 Nov 2022 16:38:34 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 470781946594 for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  3 Nov 2022 16:38:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 27912492B20; Thu,  3 Nov 2022 16:38:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16280492B06;
 Thu,  3 Nov 2022 16:38:31 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20221103161637.1725471-7-dwysocha@redhat.com>
References: <20221103161637.1725471-7-dwysocha@redhat.com>
 <20221103161637.1725471-1-dwysocha@redhat.com>
To: Dave Wysochanski <dwysocha@redhat.com>
MIME-Version: 1.0
Date: Thu, 03 Nov 2022 16:38:31 +0000
Message-ID: <108533.1667493511@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Linux-cachefs] [RFC PATCH v10 6/6] netfs: Change
 netfs_inode_init to allocate memory to allow opt-in
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: linux-nfs@vger.kernel.org,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-cachefs@redhat.com,
 Benjamin Maynard <benmaynard@google.com>,
 Anna Schumaker <anna.schumaker@netapp.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <108532.1667493511.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dave Wysochanski <dwysocha@redhat.com> wrote:

> This saves memory for network filesystems inode that would build
> in netfs support, but like to opt-in to netfs on some mounts while
> opting-out of netfs on other mounts.
> ...
>  static struct inode *afs_alloc_inode(struct super_block *sb)
>  {
>  	struct afs_vnode *vnode;
> +	int	ret;
>  
>  	vnode = alloc_inode_sb(sb, afs_inode_cachep, GFP_KERNEL);
>  	if (!vnode)
>  		return NULL;
>  
> +	ret = netfs_inode_init(&vnode->netfs, &afs_req_ops);
> +	if (ret) {
> +		afs_free_inode(AFS_VNODE_TO_I(vnode));
> +		return NULL;
> +	}
>  	atomic_inc(&afs_count_active_inodes);
>  
>  	/* Reset anything that shouldn't leak from one inode to the next. */

This makes the memory footprint worse for 9p, afs, ceph and cifs - and adds a
time penalty to inode creation and destruction as well (though probably not a
huge amount).

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

