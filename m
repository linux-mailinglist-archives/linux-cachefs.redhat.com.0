Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F655A8409
	for <lists+linux-cachefs@lfdr.de>; Wed, 31 Aug 2022 19:15:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661966103;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=y/JP5AxhlVaKvRkBRK3CiMTekDOw7tSDi9EGKXml4pE=;
	b=YleCW/Yt5wvev+295EtH/CfPX06vDBzGDwl35eWBe8R03uch7xG3uNNY4/VVuKqnLv84BZ
	R4/HKxZZJLZYNCLo86prCm4c3EePMlqf7XVWWzb1CnhEJepyd5UGb015PyN62uD94XBBtC
	h3SGeff54PcZJ1XzWYuMeJYUqI318PA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-qbdSpZiEPo-FvACCASAYhw-1; Wed, 31 Aug 2022 13:15:00 -0400
X-MC-Unique: qbdSpZiEPo-FvACCASAYhw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92C1D964081;
	Wed, 31 Aug 2022 17:14:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D70A403349;
	Wed, 31 Aug 2022 17:14:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C57081946A4B;
	Wed, 31 Aug 2022 17:14:58 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AAC791946A40 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 31 Aug 2022 16:31:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3FC2C2166B2A; Wed, 31 Aug 2022 16:31:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BFB12166B26
 for <linux-cachefs@redhat.com>; Wed, 31 Aug 2022 16:31:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EE141066680
 for <linux-cachefs@redhat.com>; Wed, 31 Aug 2022 16:31:50 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-smDBfVhyN8eXL2eHfmbMTA-1; Wed, 31 Aug 2022 12:31:46 -0400
X-MC-Unique: smDBfVhyN8eXL2eHfmbMTA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 35F1A619B0;
 Wed, 31 Aug 2022 16:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE0BC433D6;
 Wed, 31 Aug 2022 16:31:42 +0000 (UTC)
Message-ID: <6a8523552dba647518fd8590349d64d25d1b6fe4.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Dave Wysochanski <dwysocha@redhat.com>, Anna Schumaker
 <anna.schumaker@netapp.com>, Trond Myklebust
 <trond.myklebust@hammerspace.com>,  David Howells <dhowells@redhat.com>
Date: Wed, 31 Aug 2022 12:31:41 -0400
In-Reply-To: <20220831005053.1287363-2-dwysocha@redhat.com>
References: <20220831005053.1287363-1-dwysocha@redhat.com>
 <20220831005053.1287363-2-dwysocha@redhat.com>
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [Linux-cachefs] [PATCH v3 1/3] NFS: Rename
 readpage_async_filler to nfs_pageio_add_page
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
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com,
 Benjamin Maynard <benmaynard@google.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2022-08-30 at 20:50 -0400, Dave Wysochanski wrote:
> Rename readpage_async_filler to nfs_pageio_add_page to
> better reflect what this function does (add a page to
> the nfs_pageio_descriptor), and simplify arguments to
> this function by removing struct nfs_readdesc.
> 
> Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
> ---
>  fs/nfs/read.c | 60 +++++++++++++++++++++++++--------------------------
>  1 file changed, 30 insertions(+), 30 deletions(-)
> 
> diff --git a/fs/nfs/read.c b/fs/nfs/read.c
> index 8ae2c8d1219d..525e82ea9a9e 100644
> --- a/fs/nfs/read.c
> +++ b/fs/nfs/read.c
> @@ -127,11 +127,6 @@ static void nfs_readpage_release(struct nfs_page *req, int error)
>  	nfs_release_request(req);
>  }
>  
> -struct nfs_readdesc {
> -	struct nfs_pageio_descriptor pgio;
> -	struct nfs_open_context *ctx;
> -};
> -
>  static void nfs_page_group_set_uptodate(struct nfs_page *req)
>  {
>  	if (nfs_page_group_sync_on_bit(req, PG_UPTODATE))
> @@ -153,7 +148,8 @@ static void nfs_read_completion(struct nfs_pgio_header *hdr)
>  
>  		if (test_bit(NFS_IOHDR_EOF, &hdr->flags)) {
>  			/* note: regions of the page not covered by a
> -			 * request are zeroed in readpage_async_filler */
> +			 * request are zeroed in nfs_pageio_add_page
> +			 */
>  			if (bytes > hdr->good_bytes) {
>  				/* nothing in this request was good, so zero
>  				 * the full extent of the request */
> @@ -281,8 +277,10 @@ static void nfs_readpage_result(struct rpc_task *task,
>  		nfs_readpage_retry(task, hdr);
>  }
>  
> -static int
> -readpage_async_filler(struct nfs_readdesc *desc, struct page *page)
> +int
> +nfs_pageio_add_page(struct nfs_pageio_descriptor *pgio,
> +		    struct nfs_open_context *ctx,
> +		    struct page *page)
>  {
>  	struct inode *inode = page_file_mapping(page)->host;
>  	unsigned int rsize = NFS_SERVER(inode)->rsize;
> @@ -302,15 +300,15 @@ readpage_async_filler(struct nfs_readdesc *desc, struct page *page)
>  			goto out_unlock;
>  	}
>  
> -	new = nfs_create_request(desc->ctx, page, 0, aligned_len);
> +	new = nfs_create_request(ctx, page, 0, aligned_len);
>  	if (IS_ERR(new))
>  		goto out_error;
>  
>  	if (len < PAGE_SIZE)
>  		zero_user_segment(page, len, PAGE_SIZE);
> -	if (!nfs_pageio_add_request(&desc->pgio, new)) {
> +	if (!nfs_pageio_add_request(pgio, new)) {
>  		nfs_list_remove_request(new);
> -		error = desc->pgio.pg_error;
> +		error = pgio->pg_error;
>  		nfs_readpage_release(new, error);
>  		goto out;
>  	}
> @@ -332,7 +330,8 @@ readpage_async_filler(struct nfs_readdesc *desc, struct page *page)
>  int nfs_read_folio(struct file *file, struct folio *folio)
>  {
>  	struct page *page = &folio->page;
> -	struct nfs_readdesc desc;
> +	struct nfs_pageio_descriptor pgio;
> +	struct nfs_open_context *ctx;
>  	struct inode *inode = page_file_mapping(page)->host;
>  	int ret;
>  
> @@ -358,29 +357,29 @@ int nfs_read_folio(struct file *file, struct folio *folio)
>  
>  	if (file == NULL) {
>  		ret = -EBADF;
> -		desc.ctx = nfs_find_open_context(inode, NULL, FMODE_READ);
> -		if (desc.ctx == NULL)
> +		ctx = nfs_find_open_context(inode, NULL, FMODE_READ);
> +		if (ctx == NULL)
>  			goto out_unlock;
>  	} else
> -		desc.ctx = get_nfs_open_context(nfs_file_open_context(file));
> +		ctx = get_nfs_open_context(nfs_file_open_context(file));
>  
> -	xchg(&desc.ctx->error, 0);
> -	nfs_pageio_init_read(&desc.pgio, inode, false,
> +	xchg(&ctx->error, 0);
> +	nfs_pageio_init_read(&pgio, inode, false,
>  			     &nfs_async_read_completion_ops);
>  
> -	ret = readpage_async_filler(&desc, page);
> +	ret = nfs_pageio_add_page(&pgio, ctx, page);
>  	if (ret)
>  		goto out;
>  
> -	nfs_pageio_complete_read(&desc.pgio);
> -	ret = desc.pgio.pg_error < 0 ? desc.pgio.pg_error : 0;
> +	nfs_pageio_complete_read(&pgio);
> +	ret = pgio.pg_error < 0 ? pgio.pg_error : 0;
>  	if (!ret) {
>  		ret = wait_on_page_locked_killable(page);
>  		if (!PageUptodate(page) && !ret)
> -			ret = xchg(&desc.ctx->error, 0);
> +			ret = xchg(&ctx->error, 0);
>  	}
>  out:
> -	put_nfs_open_context(desc.ctx);
> +	put_nfs_open_context(ctx);
>  	trace_nfs_aop_readpage_done(inode, page, ret);
>  	return ret;
>  out_unlock:
> @@ -391,9 +390,10 @@ int nfs_read_folio(struct file *file, struct folio *folio)
>  
>  void nfs_readahead(struct readahead_control *ractl)
>  {
> +	struct nfs_pageio_descriptor pgio;
> +	struct nfs_open_context *ctx;
>  	unsigned int nr_pages = readahead_count(ractl);
>  	struct file *file = ractl->file;
> -	struct nfs_readdesc desc;
>  	struct inode *inode = ractl->mapping->host;
>  	struct page *page;
>  	int ret;
> @@ -407,25 +407,25 @@ void nfs_readahead(struct readahead_control *ractl)
>  
>  	if (file == NULL) {
>  		ret = -EBADF;
> -		desc.ctx = nfs_find_open_context(inode, NULL, FMODE_READ);
> -		if (desc.ctx == NULL)
> +		ctx = nfs_find_open_context(inode, NULL, FMODE_READ);
> +		if (ctx == NULL)
>  			goto out;
>  	} else
> -		desc.ctx = get_nfs_open_context(nfs_file_open_context(file));
> +		ctx = get_nfs_open_context(nfs_file_open_context(file));
>  
> -	nfs_pageio_init_read(&desc.pgio, inode, false,
> +	nfs_pageio_init_read(&pgio, inode, false,
>  			     &nfs_async_read_completion_ops);
>  
>  	while ((page = readahead_page(ractl)) != NULL) {
> -		ret = readpage_async_filler(&desc, page);
> +		ret = nfs_pageio_add_page(&pgio, ctx, page);
>  		put_page(page);
>  		if (ret)
>  			break;
>  	}
>  
> -	nfs_pageio_complete_read(&desc.pgio);
> +	nfs_pageio_complete_read(&pgio);
>  
> -	put_nfs_open_context(desc.ctx);
> +	put_nfs_open_context(ctx);
>  out:
>  	trace_nfs_aop_readahead_done(inode, nr_pages, ret);
>  }

Yeah, a special args struct only with 2 fields in it does seem sort of
pointless:

Reviewed-by: Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

