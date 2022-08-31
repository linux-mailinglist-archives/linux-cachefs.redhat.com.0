Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D854F5A86DC
	for <lists+linux-cachefs@lfdr.de>; Wed, 31 Aug 2022 21:39:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661974780;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=z0JyHy/LcLn2veEC5qKoF6M5jOr1uAvbOLv2rjCzPoI=;
	b=g8WoOBSvPfvwWcwuFOZBmiKxP/T34hu6FsakkNUr+uwFKVwXL30H9V/NenM07QIhTSd7+i
	bxUq9HqQIG4nlqML8bvTfQh1M4Lz5Qx26yR5PcBx7EzY9UJMrtPTy+hHPqfkFA/ish7Cxa
	3V4dkFxW5KJvdy4yDbVGyjxK+ebBT2s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-Yigysb0ZOLe1jqQosw6vyg-1; Wed, 31 Aug 2022 15:39:40 -0400
X-MC-Unique: Yigysb0ZOLe1jqQosw6vyg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D56F18188A2;
	Wed, 31 Aug 2022 19:39:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C317B40E7F2B;
	Wed, 31 Aug 2022 19:39:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 108CB1946A6F;
	Wed, 31 Aug 2022 19:39:38 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4CFD31946A40 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 31 Aug 2022 18:58:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3985A2166B2A; Wed, 31 Aug 2022 18:58:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 350802166B26
 for <linux-cachefs@redhat.com>; Wed, 31 Aug 2022 18:58:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18EE2101A54E
 for <linux-cachefs@redhat.com>; Wed, 31 Aug 2022 18:58:26 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-607-dd-4RX4_O5GysrJqQWYgkg-1; Wed,
 31 Aug 2022 14:58:23 -0400
X-MC-Unique: dd-4RX4_O5GysrJqQWYgkg-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oTSuq-005MIW-SL; Wed, 31 Aug 2022 18:58:20 +0000
Date: Wed, 31 Aug 2022 19:58:20 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <Yw+vTFdk4gAoNR27@casper.infradead.org>
References: <20220831005053.1287363-1-dwysocha@redhat.com>
 <20220831005053.1287363-4-dwysocha@redhat.com>
 <2c4f4fae20c702e805162f7fa780fc09f7f05aaa.camel@kernel.org>
MIME-Version: 1.0
In-Reply-To: <2c4f4fae20c702e805162f7fa780fc09f7f05aaa.camel@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [Linux-cachefs] [PATCH v3 3/3] NFS: Convert buffered read paths
 to use netfs when fscache is enabled
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 31, 2022 at 02:21:23PM -0400, Jeff Layton wrote:
> > +static int nfs_netfs_init_request(struct netfs_io_request *rreq, struct file *file)
> >  {
> > -	struct netfs_cache_resources cres;
> > -	struct fscache_cookie *cookie = netfs_i_cookie(&NFS_I(inode)->netfs);
> > -	struct iov_iter iter;
> > -	struct bio_vec bvec[1];
> > -	int ret;
> > -
> > -	memset(&cres, 0, sizeof(cres));
> > -	bvec[0].bv_page		= page;
> > -	bvec[0].bv_offset	= 0;
> > -	bvec[0].bv_len		= PAGE_SIZE;
> > -	iov_iter_bvec(&iter, READ, bvec, ARRAY_SIZE(bvec), PAGE_SIZE);
> > -
> > -	ret = fscache_begin_read_operation(&cres, cookie);
> > -	if (ret < 0)
> > -		return ret;
> > -
> > -	ret = fscache_read(&cres, page_offset(page), &iter, NETFS_READ_HOLE_FAIL,
> > -			   NULL, NULL);
> > -	fscache_end_operation(&cres);
> > -	return ret;
> > +	struct nfs_open_context *ctx;
> > +
> > +	if (file == NULL) {
> > +		ctx = nfs_find_open_context(rreq->inode, NULL, FMODE_READ);
> > +		if (!ctx)
> > +			return -ENOMEM;
> 
> That error return seems like an odd choice. A NULL return here just
> means that we don't have a suitable open file, not that we're out of
> memory.
> 
> I think a NULL file pointer from netfs can only happen in readahead, and
> the comments over readahead_control say:
> 
>  * @file: The file, used primarily by network filesystems for authentication.
>  *        May be NULL if invoked internally by the filesystem.
> 
> AFAICT though, only f2fs and ext4 invoke it internally.
> 
> Maybe instead of doing this, it ought to just throw a WARN if we get a
> NULL file pointer and return -EINVAL or something?
> 
> Willy, am I correct on when ractl->file can be NULL?

Yes.  Just to quickly verify it:

$ git grep -w DEFINE_READAHEAD
fs/ext4/verity.c:       DEFINE_READAHEAD(ractl, NULL, NULL, inode->i_mapping, index);
fs/f2fs/file.c: DEFINE_READAHEAD(ractl, NULL, NULL, inode->i_mapping, page_idx);
fs/f2fs/verity.c:       DEFINE_READAHEAD(ractl, NULL, NULL, inode->i_mapping, index);
fs/netfs/buffered_read.c:       DEFINE_READAHEAD(ractl, file, NULL, mapping, index);
fs/verity/enable.c:     DEFINE_READAHEAD(ractl, file, ra, file->f_mapping, index);
include/linux/pagemap.h:#define DEFINE_READAHEAD(ractl, f, r, m, i)                             \
include/linux/pagemap.h:        DEFINE_READAHEAD(ractl, file, ra, mapping, index);
include/linux/pagemap.h:        DEFINE_READAHEAD(ractl, file, ra, mapping, index);
mm/filemap.c:   DEFINE_READAHEAD(ractl, file, &file->f_ra, mapping, folio->index);
mm/filemap.c:   DEFINE_READAHEAD(ractl, file, ra, mapping, vmf->pgoff);
mm/filemap.c:   DEFINE_READAHEAD(ractl, file, ra, file->f_mapping, vmf->pgoff);
mm/internal.h:  DEFINE_READAHEAD(ractl, file, &file->f_ra, mapping, index);

Those two uses in pagemap.h are wrappers, so we need to check their
callers too:

$ git grep 'page_cache_\(a\)*sync_readahead'
mm/filemap.c:           page_cache_sync_readahead(mapping, ra, filp, index,
mm/khugepaged.c:                                page_cache_sync_readahead(mapping, &file->f_ra,
(ignoring the ones inside filesystems)

So yes, they all pass in a real struct file.  I wouldn't even check
whether the file pointer is NULL; just assume that it's not and the
crash will be obvious to debug.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

