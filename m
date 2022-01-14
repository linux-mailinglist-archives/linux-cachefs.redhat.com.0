Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E8148E2C9
	for <lists+linux-cachefs@lfdr.de>; Fri, 14 Jan 2022 04:03:34 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-vhiF3l8mOdiLpy4y8cKGVQ-1; Thu, 13 Jan 2022 22:03:30 -0500
X-MC-Unique: vhiF3l8mOdiLpy4y8cKGVQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5189F2F24;
	Fri, 14 Jan 2022 03:03:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23F695BE2A;
	Fri, 14 Jan 2022 03:03:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 670CD1809CB8;
	Fri, 14 Jan 2022 03:03:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20E2vB4W010201 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 13 Jan 2022 21:57:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A42C4201AC7D; Fri, 14 Jan 2022 02:57:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F8C32024CCA
	for <linux-cachefs@redhat.com>; Fri, 14 Jan 2022 02:57:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77156811E76
	for <linux-cachefs@redhat.com>; Fri, 14 Jan 2022 02:57:06 +0000 (UTC)
Received: from out30-54.freemail.mail.aliyun.com
	(out30-54.freemail.mail.aliyun.com [115.124.30.54]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-428-lsqn33HNMIK1FUogYkaZlw-1; Thu, 13 Jan 2022 21:56:55 -0500
X-MC-Unique: lsqn33HNMIK1FUogYkaZlw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
	MF=hsiangkao@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
	TI=SMTPD_---0V1mpJoz_1642129007
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
	fp:SMTPD_---0V1mpJoz_1642129007) by smtp.aliyun-inc.com(127.0.0.1);
	Fri, 14 Jan 2022 10:56:49 +0800
Date: Fri, 14 Jan 2022 10:56:47 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: David Howells <dhowells@redhat.com>
Message-ID: <YeDmb0QDWVTb/7o7@B-P7TQMD6M-0146.local>
References: <20220113122155.125320-1-jefflexu@linux.alibaba.com>
	<1829150.1642080431@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <1829150.1642080431@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: xiang@kernel.org, linux-cachefs@redhat.com, jlayton@kernel.org
Subject: Re: [Linux-cachefs] [PATCH v2] netfs: Make @file optional in
 netfs_alloc_read_request()
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi David,

On Thu, Jan 13, 2022 at 01:27:11PM +0000, David Howells wrote:
> Jeffle Xu <jefflexu@linux.alibaba.com> wrote:
> 
> > Make the @file parameter optional, and derive inode from the @folio
> > parameter instead in order to support file system internal requests.
> > 
> > @file parameter can't be removed completely, since it also works as
> > the private data of ops->init_rreq().
> 
> Note that I'm working towards a model where you would ordinarily point your
> file operations and/or address-space operations directly at the netfs
> functions.  This will require filesystems that use it to add a bit to their
> fs-specific inode structs directly after the struct inode member.

Sorry, I'm not sure if I understand your main idea here..
Would you mind give more hints about this? Thanks in advance!

As I said earlier, what we'd like to do is to use read_cache_page_gfp()
in EROFS directly calling netfs mapping (and it's a common practice to
make fs internal requests) to get a netfs page cache page filled with
data rather than directly use netfs_alloc_read_request() or whatever.

    read_cache_page_gfp
        -> netfs_readpage (without file)
          -> netfs_alloc_read_request

in such condition, there is no file open in advance.. 

Besides, what I can see is currently

int netfs_readpage(struct file *file,
                   struct folio *folio,
                   const struct netfs_read_request_ops *ops,
                   void *netfs_priv)

netfs_priv is actually unused (NULL), can we pass in fs private stuffs
(such as file->private_data) with this instead? and turn

void (*init_rreq)(struct netfs_read_request *rreq, struct file *file);

into

void (*init_rreq)(struct netfs_read_request *rreq, void *netfs_priv);

in order to match

void (*cleanup)(struct netfs_read_request *rreq, void *netfs_priv);


It seems all current callers leave netfs_priv as NULL:
9p/vfs_addr.c:  return netfs_readpage(file, folio, &v9fs_req_ops, NULL);
afs/file.c:     return netfs_readpage(file, folio, &afs_req_ops, NULL);
ceph/addr.c:    return netfs_readpage(file, folio, &ceph_netfs_read_ops, NULL);

Thanks,
Gao Xiang

> 
> David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

