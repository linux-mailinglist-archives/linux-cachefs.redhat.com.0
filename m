Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D565F3D13FA
	for <lists+linux-cachefs@lfdr.de>; Wed, 21 Jul 2021 18:21:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626884468;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UtvDhZKCqmiLNeY9Gbwcfaoj1MaqZzLwRS4elsqiI0w=;
	b=TSafpPpiQXlHDIKrnAHwHJmY5KDSJI2XhMPYNB5H5hM3qeoqZU6j60oCZfSeWn0UUMXDP3
	f9Yr6YO8yZGE3NZulN0XFcR94nWmI4858Fqcahmb3el65W27Au3pBeKRY6VcHsAUQIUTiF
	0yU+LoHLzYK/Zuy/6CaeqSNCBmKCLd8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-d1g3H93vOUKdZKir9RH88A-1; Wed, 21 Jul 2021 12:21:07 -0400
X-MC-Unique: d1g3H93vOUKdZKir9RH88A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E630A801B2E;
	Wed, 21 Jul 2021 16:21:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF38368D9B;
	Wed, 21 Jul 2021 16:21:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1FE911819AC9;
	Wed, 21 Jul 2021 16:21:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16LGKtcv020046 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 21 Jul 2021 12:20:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 586602013564; Wed, 21 Jul 2021 16:20:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51B7C21CAC97
	for <linux-cachefs@redhat.com>; Wed, 21 Jul 2021 16:20:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55109185A7A4
	for <linux-cachefs@redhat.com>; Wed, 21 Jul 2021 16:20:48 +0000 (UTC)
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
	[209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-593-oRK17l3VMDm52m6mi-lsgQ-1; Wed, 21 Jul 2021 12:20:45 -0400
X-MC-Unique: oRK17l3VMDm52m6mi-lsgQ-1
Received: by mail-qv1-f70.google.com with SMTP id
	l4-20020a0ce8440000b02902d89f797d08so1858762qvo.17
	for <linux-cachefs@redhat.com>; Wed, 21 Jul 2021 09:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=YkZTscC6KpmV7ZPZQ/arpngaCqGBZg3nbQ0knfcsigA=;
	b=l2UOQh3jxRJY6sjxwA3Ad+kAhe7a/FeG+AwuTdgEmnTS/eeHYpAjv8KmSIsvRJ1Vrm
	3+V1Rbw+vyoWggxPpNKt7SxstYdAIkgsPZM9gQJ1AMmNAHL0wIc28iMcpU+50Euis72W
	WiNZN/xV+3bNDKK6h2B5gfWzl0yKzR644PYbkAi9LIIS6Ow4L08zpaeiknMnN/aPwhSG
	rJp0rVP7gpWNiSvOCac0TDAi0nO8XKJ6XCZnp3366cD1U2SbuBw31gDZ67JVS59CnOdJ
	L9jxznyEA8Vx5HUVmitp7sPLEXYrxhzG4c3M+g4Lzlr4Q1DBgxk2OMlk6Vo5a9bT4kQr
	A8RQ==
X-Gm-Message-State: AOAM530wQkY9U3s+IC8wN9PQceSnIcu9ZOVZT0jR0Sqj9tMd+XHmyj/r
	MG3tqwSolcDGyAKh28HOFzu5YPaDNF5NU12iDkPGkIIm3vLSVJrD40qlHcuFIQl641BsMj4bpsf
	OSs/hfuwrR6kqrodcsiUotw==
X-Received: by 2002:a0c:a223:: with SMTP id f32mr37104021qva.8.1626884444602; 
	Wed, 21 Jul 2021 09:20:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+t6fxG/ixd7o7dlSLuaUhbdIrVbCJpvX027HWNZq9vT5wDnkVq2oxjwvDHG0JV/G1ddMkig==
X-Received: by 2002:a0c:a223:: with SMTP id f32mr37103999qva.8.1626884444411; 
	Wed, 21 Jul 2021 09:20:44 -0700 (PDT)
Received: from [192.168.1.3] (68-20-15-154.lightspeed.rlghnc.sbcglobal.net.
	[68.20.15.154]) by smtp.gmail.com with ESMTPSA id
	i4sm9475118qka.130.2021.07.21.09.20.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 21 Jul 2021 09:20:43 -0700 (PDT)
Message-ID: <35ecb577315f486f1636b2316c2051ad004f6f7b.camel@redhat.com>
From: Jeff Layton <jlayton@redhat.com>
To: David Howells <dhowells@redhat.com>, linux-fsdevel@vger.kernel.org
Date: Wed, 21 Jul 2021 12:20:42 -0400
In-Reply-To: <162687508008.276387.6418924257569297305.stgit@warthog.procyon.org.uk>
References: <162687506932.276387.14456718890524355509.stgit@warthog.procyon.org.uk>
	<162687508008.276387.6418924257569297305.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-nfs@vger.kernel.org,
	Dominique, Miklos Szeredi <miklos@szeredi.hu>,
	Torvalds <torvalds@linux-foundation.org>,
	Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	v9fs-developer@lists.sourceforge.net, linux-cifs@vger.kernel.org,
	ceph-devel@vger.kernel.org, Linus,
	Anna Schumaker <anna.schumaker@netapp.com>,
	devel@lists.orangefs.org, Mike Marshall <hubcap@omnibond.com>
Subject: Re: [Linux-cachefs] [RFC PATCH 01/12] afs: Sort out symlink reading
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2021-07-21 at 14:44 +0100, David Howells wrote:
> afs_readpage() doesn't get a file pointer when called for a symlink, so
> separate it from regular file pointer handling.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> ---
> 
>  fs/afs/file.c     |   14 +++++++++-----
>  fs/afs/inode.c    |    6 +++---
>  fs/afs/internal.h |    3 ++-
>  3 files changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/afs/file.c b/fs/afs/file.c
> index ca0d993add65..c9c21ad0e7c9 100644
> --- a/fs/afs/file.c
> +++ b/fs/afs/file.c
> @@ -19,6 +19,7 @@
>  
>  static int afs_file_mmap(struct file *file, struct vm_area_struct *vma);
>  static int afs_readpage(struct file *file, struct page *page);
> +static int afs_symlink_readpage(struct file *file, struct page *page);
>  static void afs_invalidatepage(struct page *page, unsigned int offset,
>  			       unsigned int length);
>  static int afs_releasepage(struct page *page, gfp_t gfp_flags);
> @@ -46,7 +47,7 @@ const struct inode_operations afs_file_inode_operations = {
>  	.permission	= afs_permission,
>  };
>  
> -const struct address_space_operations afs_fs_aops = {
> +const struct address_space_operations afs_file_aops = {
>  	.readpage	= afs_readpage,
>  	.readahead	= afs_readahead,
>  	.set_page_dirty	= afs_set_page_dirty,
> @@ -60,6 +61,12 @@ const struct address_space_operations afs_fs_aops = {
>  	.writepages	= afs_writepages,
>  };
>  
> +const struct address_space_operations afs_symlink_aops = {
> +	.readpage	= afs_symlink_readpage,
> +	.releasepage	= afs_releasepage,
> +	.invalidatepage	= afs_invalidatepage,
> +};
> +
>  static const struct vm_operations_struct afs_vm_ops = {
>  	.fault		= filemap_fault,
>  	.map_pages	= filemap_map_pages,
> @@ -321,7 +328,7 @@ static void afs_req_issue_op(struct netfs_read_subrequest *subreq)
>  	afs_fetch_data(fsreq->vnode, fsreq);
>  }
>  
> -static int afs_symlink_readpage(struct page *page)
> +static int afs_symlink_readpage(struct file *file, struct page *page)
>  {
>  	struct afs_vnode *vnode = AFS_FS_I(page->mapping->host);
>  	struct afs_read *fsreq;


I wonder...would you be better served here by not using page_readlink
for symlinks and instead use simple_get_link and roll your own readlink
operation. It seems a bit more direct, and AFS seems to be the only
caller of page_readlink.

> @@ -386,9 +393,6 @@ const struct netfs_read_request_ops afs_req_ops = {
>  
>  static int afs_readpage(struct file *file, struct page *page)
>  {
> -	if (!file)
> -		return afs_symlink_readpage(page);
> -
>  	return netfs_readpage(file, page, &afs_req_ops, NULL);
>  }
>  
> diff --git a/fs/afs/inode.c b/fs/afs/inode.c
> index bef6f5ccfb09..cf7b66957c6f 100644
> --- a/fs/afs/inode.c
> +++ b/fs/afs/inode.c
> @@ -105,7 +105,7 @@ static int afs_inode_init_from_status(struct afs_operation *op,
>  		inode->i_mode	= S_IFREG | (status->mode & S_IALLUGO);
>  		inode->i_op	= &afs_file_inode_operations;
>  		inode->i_fop	= &afs_file_operations;
> -		inode->i_mapping->a_ops	= &afs_fs_aops;
> +		inode->i_mapping->a_ops	= &afs_file_aops;
>  		break;
>  	case AFS_FTYPE_DIR:
>  		inode->i_mode	= S_IFDIR |  (status->mode & S_IALLUGO);
> @@ -123,11 +123,11 @@ static int afs_inode_init_from_status(struct afs_operation *op,
>  			inode->i_mode	= S_IFDIR | 0555;
>  			inode->i_op	= &afs_mntpt_inode_operations;
>  			inode->i_fop	= &afs_mntpt_file_operations;
> -			inode->i_mapping->a_ops	= &afs_fs_aops;
> +			inode->i_mapping->a_ops	= &afs_symlink_aops;
>  		} else {
>  			inode->i_mode	= S_IFLNK | status->mode;
>  			inode->i_op	= &afs_symlink_inode_operations;
> -			inode->i_mapping->a_ops	= &afs_fs_aops;
> +			inode->i_mapping->a_ops	= &afs_symlink_aops;
>  		}
>  		inode_nohighmem(inode);
>  		break;
> diff --git a/fs/afs/internal.h b/fs/afs/internal.h
> index 791cf02e5696..ccdde00ada8a 100644
> --- a/fs/afs/internal.h
> +++ b/fs/afs/internal.h
> @@ -1050,7 +1050,8 @@ extern void afs_dynroot_depopulate(struct super_block *);
>  /*
>   * file.c
>   */
> -extern const struct address_space_operations afs_fs_aops;
> +extern const struct address_space_operations afs_file_aops;
> +extern const struct address_space_operations afs_symlink_aops;
>  extern const struct inode_operations afs_file_inode_operations;
>  extern const struct file_operations afs_file_operations;
>  extern const struct netfs_read_request_ops afs_req_ops;
> 
> 

Regardless, this is more reasonable than what's there now.

Reviewed-by: Jeff Layton <jlayton@redhat.com>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

