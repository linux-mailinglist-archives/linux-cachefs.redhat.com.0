Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE1E4842EC
	for <lists+linux-cachefs@lfdr.de>; Tue,  4 Jan 2022 15:00:45 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-K98F4PNVNuCS3J3KEXBV7Q-1; Tue, 04 Jan 2022 09:00:41 -0500
X-MC-Unique: K98F4PNVNuCS3J3KEXBV7Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0801A10168D3;
	Tue,  4 Jan 2022 14:00:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9300C7ED85;
	Tue,  4 Jan 2022 14:00:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 417C218095C9;
	Tue,  4 Jan 2022 14:00:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 204E0RJG021438 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 4 Jan 2022 09:00:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D6CEB2166B46; Tue,  4 Jan 2022 14:00:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D08232166B40
	for <linux-cachefs@redhat.com>; Tue,  4 Jan 2022 14:00:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97AEA1C093C3
	for <linux-cachefs@redhat.com>; Tue,  4 Jan 2022 14:00:24 +0000 (UTC)
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
	[47.88.44.36]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-250-Gx2Zd7F_MOmn2ykmdMDyng-1; Tue, 04 Jan 2022 09:00:22 -0500
X-MC-Unique: Gx2Zd7F_MOmn2ykmdMDyng-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R991e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395;
	MF=hsiangkao@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
	TI=SMTPD_---0V0ysn7A_1641304800
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
	fp:SMTPD_---0V0ysn7A_1641304800) by smtp.aliyun-inc.com(127.0.0.1);
	Tue, 04 Jan 2022 22:00:03 +0800
Date: Tue, 4 Jan 2022 22:00:00 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <YdRS4AnHbWpHwl/8@B-P7TQMD6M-0146.local>
Mail-Followup-To: Jeffle Xu <jefflexu@linux.alibaba.com>,
	dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org, joseph.qi@linux.alibaba.com,
	bo.liu@linux.alibaba.com, tao.peng@linux.alibaba.com,
	gerry@linux.alibaba.com, eguan@linux.alibaba.com,
	linux-kernel@vger.kernel.org
References: <20211227125444.21187-1-jefflexu@linux.alibaba.com>
	<20211227125444.21187-6-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20211227125444.21187-6-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: chao@kernel.org, tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	linux-cachefs@redhat.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, xiang@kernel.org,
	gerry@linux.alibaba.com, linux-erofs@lists.ozlabs.org,
	eguan@linux.alibaba.com
Subject: Re: [Linux-cachefs] [PATCH v1 05/23] netfs: add inode parameter to
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 27, 2021 at 08:54:26PM +0800, Jeffle Xu wrote:
> When working as the local cache, the @file parameter of
> netfs_alloc_read_request() represents the backed file inside netfs. It
> is for two use: 1) we can derive the corresponding inode from file,
> 2) works as the argument for ops->init_rreq().
> 
> In the new introduced demand-read mode, netfs_readpage() will be called
> by the upper fs to read from backing files. However in this new mode,
> the backed file may not be opened, and thus the @file argument is NULL
> in this case.
> 
> For netfs_readpage(), @file parameter represents the backed file inside
> netfs, while @folio parameter represents one page cache inside the
> address space of this backed file. We can still derive the inode from
> the @folio parameter, even when @file parameter is NULL.
> 
> Thus refactor netfs_alloc_read_request() somewhat for this change.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>

I'm not sure how other folks think.

Yet in principle, personally I think it's reasonable that
something like read_cache_page_gfp() could be used directly
with fscache backend as well.

So for such internal read requests, @file argument is
actually optional as a common practice.

Apart from the commit message itself (which I think it could
be simplified a bit), generally it looks good to me.

Thanks,
Gao Xiang


> ---
>  fs/netfs/read_helper.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
> index 8c58cff420ba..ca84918b6b5d 100644
> --- a/fs/netfs/read_helper.c
> +++ b/fs/netfs/read_helper.c
> @@ -39,7 +39,7 @@ static void netfs_put_subrequest(struct netfs_read_subrequest *subreq,
>  
>  static struct netfs_read_request *netfs_alloc_read_request(
>  	const struct netfs_read_request_ops *ops, void *netfs_priv,
> -	struct file *file)
> +	struct inode *inode, struct file *file)
>  {
>  	static atomic_t debug_ids;
>  	struct netfs_read_request *rreq;
> @@ -48,7 +48,7 @@ static struct netfs_read_request *netfs_alloc_read_request(
>  	if (rreq) {
>  		rreq->netfs_ops	= ops;
>  		rreq->netfs_priv = netfs_priv;
> -		rreq->inode	= file_inode(file);
> +		rreq->inode	= inode;
>  		rreq->i_size	= i_size_read(rreq->inode);
>  		rreq->debug_id	= atomic_inc_return(&debug_ids);
>  		INIT_LIST_HEAD(&rreq->subrequests);
> @@ -870,6 +870,7 @@ void netfs_readahead(struct readahead_control *ractl,
>  		     void *netfs_priv)
>  {
>  	struct netfs_read_request *rreq;
> +	struct inode *inode = file_inode(ractl->file);
>  	unsigned int debug_index = 0;
>  	int ret;
>  
> @@ -878,7 +879,7 @@ void netfs_readahead(struct readahead_control *ractl,
>  	if (readahead_count(ractl) == 0)
>  		goto cleanup;
>  
> -	rreq = netfs_alloc_read_request(ops, netfs_priv, ractl->file);
> +	rreq = netfs_alloc_read_request(ops, netfs_priv, inode, ractl->file);
>  	if (!rreq)
>  		goto cleanup;
>  	rreq->mapping	= ractl->mapping;
> @@ -948,12 +949,13 @@ int netfs_readpage(struct file *file,
>  		   void *netfs_priv)
>  {
>  	struct netfs_read_request *rreq;
> +	struct inode *inode = folio_file_mapping(folio)->host;
>  	unsigned int debug_index = 0;
>  	int ret;
>  
>  	_enter("%lx", folio_index(folio));
>  
> -	rreq = netfs_alloc_read_request(ops, netfs_priv, file);
> +	rreq = netfs_alloc_read_request(ops, netfs_priv, inode, file);
>  	if (!rreq) {
>  		if (netfs_priv)
>  			ops->cleanup(folio_file_mapping(folio), netfs_priv);
> @@ -1122,7 +1124,7 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
>  	}
>  
>  	ret = -ENOMEM;
> -	rreq = netfs_alloc_read_request(ops, netfs_priv, file);
> +	rreq = netfs_alloc_read_request(ops, netfs_priv, inode, file);
>  	if (!rreq)
>  		goto error;
>  	rreq->mapping		= folio_file_mapping(folio);
> -- 
> 2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

