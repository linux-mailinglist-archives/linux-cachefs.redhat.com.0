Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 912D4619598
	for <lists+linux-cachefs@lfdr.de>; Fri,  4 Nov 2022 12:46:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667562417;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=d/nelGDmoSeYqTM/1NaNxsHOxYJX0BRChwGWBC8xZrE=;
	b=cul87Q1/G27RxKCA5zEKRslPsko+/9J1BikxF2ijjjWaoSKp4hNEJUlZYiQwaUEbcJz60c
	WYnCBSdNvLTGLfTx+1ORC7oPVpQL0DV+9TZcGEKA5KoAZb4QKyBZt+MZy+l5VVkdQ6lfHs
	F+uH5pcJusS3NYfdoIIcCi7odKwkLow=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-tWpm1jHpP1KS2Q1mnjohEg-1; Fri, 04 Nov 2022 07:46:54 -0400
X-MC-Unique: tWpm1jHpP1KS2Q1mnjohEg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB54038164DC;
	Fri,  4 Nov 2022 11:46:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C05B02166B26;
	Fri,  4 Nov 2022 11:46:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CFC551946A45;
	Fri,  4 Nov 2022 11:46:46 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 015821946586 for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  4 Nov 2022 11:46:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D158F4A9254; Fri,  4 Nov 2022 11:46:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C9E024A9257
 for <linux-cachefs@redhat.com>; Fri,  4 Nov 2022 11:46:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8B888339C5
 for <linux-cachefs@redhat.com>; Fri,  4 Nov 2022 11:46:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-W-BW_C8eP_KrvsYrjjS_Kw-1; Fri, 04 Nov 2022 07:46:41 -0400
X-MC-Unique: W-BW_C8eP_KrvsYrjjS_Kw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EED326216C;
 Fri,  4 Nov 2022 11:46:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4D8C433D6;
 Fri,  4 Nov 2022 11:46:38 +0000 (UTC)
Message-ID: <2e2eceeb11972462bb9161a73c00a9c77f8af8d2.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Jingbo Xu <jefflexu@linux.alibaba.com>, dhowells@redhat.com, 
 xiang@kernel.org, chao@kernel.org, linux-cachefs@redhat.com, 
 linux-erofs@lists.ozlabs.org
Date: Fri, 04 Nov 2022 07:46:37 -0400
In-Reply-To: <20221104072637.72375-3-jefflexu@linux.alibaba.com>
References: <20221104072637.72375-1-jefflexu@linux.alibaba.com>
 <20221104072637.72375-3-jefflexu@linux.alibaba.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Linux-cachefs] [PATCH 2/2] erofs: switch to
 prepare_ondemand_read() in fscache mode
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
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Fri, 2022-11-04 at 15:26 +0800, Jingbo Xu wrote:
> Switch to prepare_ondemand_read() interface and a self-contained request
> completion to get rid of netfs_io_[request|subrequest].
>=20
> The whole request will still be split into slices (subrequest) according
> to the cache state of the backing file.  As long as one of the
> subrequests fails, the whole request will be marked as failed. Besides
> it will not retry for short read.  Similarly the whole request will fail
> if that really happens.=A0
>=20

That's sort of nasty. The kernel can generally give you a short read for
all sorts of reasons, some of which may have nothing to do with the
underlying file or filesystem.

Passing an error back to an application on a short read is probably not
what you want to do here. The usual thing to do is just to return what
you can, and let the application redrive the request if it wants.

>  Thus the subrequest structure is not a
> necessity here.  What we need is just to hold one refcount to the
> request for each subrequest during the slicing, and put the refcount
> back during the completion.
>=20
> Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
> ---
>  fs/erofs/fscache.c | 257 ++++++++++++++++-----------------------------
>  1 file changed, 92 insertions(+), 165 deletions(-)
>=20
> diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
> index 260fa4737fc0..7fc9cd35ab76 100644
> --- a/fs/erofs/fscache.c
> +++ b/fs/erofs/fscache.c
> @@ -11,253 +11,176 @@ static DEFINE_MUTEX(erofs_domain_cookies_lock);
>  static LIST_HEAD(erofs_domain_list);
>  static struct vfsmount *erofs_pseudo_mnt;
> =20
> -static struct netfs_io_request *erofs_fscache_alloc_request(struct addre=
ss_space *mapping,
> +struct erofs_fscache_request {
> +=09struct netfs_cache_resources cache_resources;
> +=09struct address_space=09*mapping;=09/* The mapping being accessed */
> +=09loff_t=09=09=09start;=09=09/* Start position */
> +=09size_t=09=09=09len;=09=09/* Length of the request */
> +=09size_t=09=09=09submitted;=09/* Length of submitted */
> +=09short=09=09=09error;=09=09/* 0 or error that occurred */
> +=09refcount_t=09=09ref;
> +};
> +
> +static struct erofs_fscache_request *erofs_fscache_req_alloc(struct addr=
ess_space *mapping,
>  =09=09=09=09=09     loff_t start, size_t len)
>  {
> -=09struct netfs_io_request *rreq;
> +=09struct erofs_fscache_request *req;
> =20
> -=09rreq =3D kzalloc(sizeof(struct netfs_io_request), GFP_KERNEL);
> -=09if (!rreq)
> +=09req =3D kzalloc(sizeof(struct erofs_fscache_request), GFP_KERNEL);
> +=09if (!req)
>  =09=09return ERR_PTR(-ENOMEM);
> =20
> -=09rreq->start=09=3D start;
> -=09rreq->len=09=3D len;
> -=09rreq->mapping=09=3D mapping;
> -=09rreq->inode=09=3D mapping->host;
> -=09INIT_LIST_HEAD(&rreq->subrequests);
> -=09refcount_set(&rreq->ref, 1);
> -=09return rreq;
> -}
> -
> -static void erofs_fscache_put_request(struct netfs_io_request *rreq)
> -{
> -=09if (!refcount_dec_and_test(&rreq->ref))
> -=09=09return;
> -=09if (rreq->cache_resources.ops)
> -=09=09rreq->cache_resources.ops->end_operation(&rreq->cache_resources);
> -=09kfree(rreq);
> -}
> -
> -static void erofs_fscache_put_subrequest(struct netfs_io_subrequest *sub=
req)
> -{
> -=09if (!refcount_dec_and_test(&subreq->ref))
> -=09=09return;
> -=09erofs_fscache_put_request(subreq->rreq);
> -=09kfree(subreq);
> -}
> -
> -static void erofs_fscache_clear_subrequests(struct netfs_io_request *rre=
q)
> -{
> -=09struct netfs_io_subrequest *subreq;
> +=09req->mapping =3D mapping;
> +=09req->start   =3D start;
> +=09req->len     =3D len;
> +=09refcount_set(&req->ref, 1);
> =20
> -=09while (!list_empty(&rreq->subrequests)) {
> -=09=09subreq =3D list_first_entry(&rreq->subrequests,
> -=09=09=09=09struct netfs_io_subrequest, rreq_link);
> -=09=09list_del(&subreq->rreq_link);
> -=09=09erofs_fscache_put_subrequest(subreq);
> -=09}
> +=09return req;
>  }
> =20
> -static void erofs_fscache_rreq_unlock_folios(struct netfs_io_request *rr=
eq)
> +static void erofs_fscache_req_complete(struct erofs_fscache_request *req=
)
>  {
> -=09struct netfs_io_subrequest *subreq;
>  =09struct folio *folio;
> -=09unsigned int iopos =3D 0;
> -=09pgoff_t start_page =3D rreq->start / PAGE_SIZE;
> -=09pgoff_t last_page =3D ((rreq->start + rreq->len) / PAGE_SIZE) - 1;
> -=09bool subreq_failed =3D false;
> -
> -=09XA_STATE(xas, &rreq->mapping->i_pages, start_page);
> +=09pgoff_t start_page =3D req->start / PAGE_SIZE;
> +=09pgoff_t last_page =3D ((req->start + req->len) / PAGE_SIZE) - 1;
> +=09bool failed =3D req->error;
> =20
> -=09subreq =3D list_first_entry(&rreq->subrequests,
> -=09=09=09=09  struct netfs_io_subrequest, rreq_link);
> -=09subreq_failed =3D (subreq->error < 0);
> +=09XA_STATE(xas, &req->mapping->i_pages, start_page);
> =20
>  =09rcu_read_lock();
>  =09xas_for_each(&xas, folio, last_page) {

You probably need to use xas_retry() here. See David's patch posted
yesterday:

    netfs: Fix missing xas_retry() calls in xarray iteration

> -=09=09unsigned int pgpos =3D
> -=09=09=09(folio_index(folio) - start_page) * PAGE_SIZE;
> -=09=09unsigned int pgend =3D pgpos + folio_size(folio);
> -=09=09bool pg_failed =3D false;
> -
> -=09=09for (;;) {
> -=09=09=09if (!subreq) {
> -=09=09=09=09pg_failed =3D true;
> -=09=09=09=09break;
> -=09=09=09}
> -
> -=09=09=09pg_failed |=3D subreq_failed;
> -=09=09=09if (pgend < iopos + subreq->len)
> -=09=09=09=09break;
> -
> -=09=09=09iopos +=3D subreq->len;
> -=09=09=09if (!list_is_last(&subreq->rreq_link,
> -=09=09=09=09=09  &rreq->subrequests)) {
> -=09=09=09=09subreq =3D list_next_entry(subreq, rreq_link);
> -=09=09=09=09subreq_failed =3D (subreq->error < 0);
> -=09=09=09} else {
> -=09=09=09=09subreq =3D NULL;
> -=09=09=09=09subreq_failed =3D false;
> -=09=09=09}
> -=09=09=09if (pgend =3D=3D iopos)
> -=09=09=09=09break;
> -=09=09}
> -
> -=09=09if (!pg_failed)
> +=09=09if (!failed)
>  =09=09=09folio_mark_uptodate(folio);
> -
>  =09=09folio_unlock(folio);
>  =09}
>  =09rcu_read_unlock();
> +
> +=09if (req->cache_resources.ops)
> +=09=09req->cache_resources.ops->end_operation(&req->cache_resources);
> +
> +=09kfree(req);
>  }
> =20
> -static void erofs_fscache_rreq_complete(struct netfs_io_request *rreq)
> +static void erofs_fscache_req_put(struct erofs_fscache_request *req)
>  {
> -=09erofs_fscache_rreq_unlock_folios(rreq);
> -=09erofs_fscache_clear_subrequests(rreq);
> -=09erofs_fscache_put_request(rreq);
> +=09if (refcount_dec_and_test(&req->ref))
> +=09=09erofs_fscache_req_complete(req);
>  }
> =20
> -static void erofc_fscache_subreq_complete(void *priv,
> +static void erofs_fscache_subreq_complete(void *priv,
>  =09=09ssize_t transferred_or_error, bool was_async)
>  {
> -=09struct netfs_io_subrequest *subreq =3D priv;
> -=09struct netfs_io_request *rreq =3D subreq->rreq;
> +=09struct erofs_fscache_request *req =3D priv;
> =20
>  =09if (IS_ERR_VALUE(transferred_or_error))
> -=09=09subreq->error =3D transferred_or_error;
> -
> -=09if (atomic_dec_and_test(&rreq->nr_outstanding))
> -=09=09erofs_fscache_rreq_complete(rreq);
> -
> -=09erofs_fscache_put_subrequest(subreq);
> +=09=09req->error =3D transferred_or_error;
> +=09erofs_fscache_req_put(req);
>  }
> =20
>  /*
> - * Read data from fscache and fill the read data into page cache describ=
ed by
> - * @rreq, which shall be both aligned with PAGE_SIZE. @pstart describes
> - * the start physical address in the cache file.
> + * Read data from fscache (cookie, pstart, len), and fill the read data =
into
> + * page cache described by (req->mapping, lstart, len). @pstart describe=
is the
> + * start physical address in the cache file.
>   */
>  static int erofs_fscache_read_folios_async(struct fscache_cookie *cookie=
,
> -=09=09=09=09struct netfs_io_request *rreq, loff_t pstart)
> +=09=09struct erofs_fscache_request *req, loff_t pstart, size_t len)
>  {
>  =09enum netfs_io_source source;
> -=09struct super_block *sb =3D rreq->mapping->host->i_sb;
> -=09struct netfs_io_subrequest *subreq;
> -=09struct netfs_cache_resources *cres =3D &rreq->cache_resources;
> +=09struct super_block *sb =3D req->mapping->host->i_sb;
> +=09struct netfs_cache_resources *cres =3D &req->cache_resources;
>  =09struct iov_iter iter;
> -=09loff_t start =3D rreq->start;
> -=09size_t len =3D rreq->len;
> +=09loff_t lstart =3D req->start + req->submitted;
>  =09size_t done =3D 0;
>  =09int ret;
> =20
> -=09atomic_set(&rreq->nr_outstanding, 1);
> +=09DBG_BUGON(len > req->len - req->submitted);
> =20
>  =09ret =3D fscache_begin_read_operation(cres, cookie);
>  =09if (ret)
> -=09=09goto out;
> +=09=09return ret;
> =20
>  =09while (done < len) {
> -=09=09subreq =3D kzalloc(sizeof(struct netfs_io_subrequest),
> -=09=09=09=09 GFP_KERNEL);
> -=09=09if (subreq) {
> -=09=09=09INIT_LIST_HEAD(&subreq->rreq_link);
> -=09=09=09refcount_set(&subreq->ref, 2);
> -=09=09=09subreq->rreq =3D rreq;
> -=09=09=09refcount_inc(&rreq->ref);
> -=09=09} else {
> -=09=09=09ret =3D -ENOMEM;
> -=09=09=09goto out;
> -=09=09}
> +=09=09loff_t sstart =3D pstart + done;
> +=09=09size_t slen =3D len - done;
> =20
> -=09=09subreq->start =3D pstart + done;
> -=09=09subreq->len=09=3D  len - done;
> -=09=09subreq->flags =3D 1 << NETFS_SREQ_ONDEMAND;
> -
> -=09=09list_add_tail(&subreq->rreq_link, &rreq->subrequests);
> -
> -=09=09source =3D cres->ops->prepare_read(subreq, LLONG_MAX);
> -=09=09if (WARN_ON(subreq->len =3D=3D 0))
> +=09=09source =3D cres->ops->prepare_ondemand_read(cres, sstart, &slen, L=
LONG_MAX);
> +=09=09if (WARN_ON(slen =3D=3D 0))
>  =09=09=09source =3D NETFS_INVALID_READ;
>  =09=09if (source !=3D NETFS_READ_FROM_CACHE) {
> -=09=09=09erofs_err(sb, "failed to fscache prepare_read (source %d)",
> -=09=09=09=09  source);
> -=09=09=09ret =3D -EIO;
> -=09=09=09subreq->error =3D ret;
> -=09=09=09erofs_fscache_put_subrequest(subreq);
> -=09=09=09goto out;
> +=09=09=09erofs_err(sb, "failed to fscache prepare_read (source %d)", sou=
rce);
> +=09=09=09return -EIO;
>  =09=09}
> =20
> -=09=09atomic_inc(&rreq->nr_outstanding);
> +=09=09refcount_inc(&req->ref);
> +=09=09iov_iter_xarray(&iter, READ, &req->mapping->i_pages,
> +=09=09=09=09lstart + done, slen);
> =20
> -=09=09iov_iter_xarray(&iter, READ, &rreq->mapping->i_pages,
> -=09=09=09=09start + done, subreq->len);
> -
> -=09=09ret =3D fscache_read(cres, subreq->start, &iter,
> -=09=09=09=09   NETFS_READ_HOLE_FAIL,
> -=09=09=09=09   erofc_fscache_subreq_complete, subreq);
> +=09=09ret =3D fscache_read(cres, sstart, &iter, NETFS_READ_HOLE_FAIL,
> +=09=09=09=09   erofs_fscache_subreq_complete, req);
>  =09=09if (ret =3D=3D -EIOCBQUEUED)
>  =09=09=09ret =3D 0;
>  =09=09if (ret) {
>  =09=09=09erofs_err(sb, "failed to fscache_read (ret %d)", ret);
> -=09=09=09goto out;
> +=09=09=09return ret;
>  =09=09}
> =20
> -=09=09done +=3D subreq->len;
> +=09=09done +=3D slen;
>  =09}
> -out:
> -=09if (atomic_dec_and_test(&rreq->nr_outstanding))
> -=09=09erofs_fscache_rreq_complete(rreq);
> -
> -=09return ret;
> +=09DBG_BUGON(done !=3D len);
> +=09req->submitted +=3D len;
> +=09return 0;
>  }
> =20
>  static int erofs_fscache_meta_read_folio(struct file *data, struct folio=
 *folio)
>  {
>  =09int ret;
>  =09struct super_block *sb =3D folio_mapping(folio)->host->i_sb;
> -=09struct netfs_io_request *rreq;
> +=09struct erofs_fscache_request *req;
>  =09struct erofs_map_dev mdev =3D {
>  =09=09.m_deviceid =3D 0,
>  =09=09.m_pa =3D folio_pos(folio),
>  =09};
> =20
>  =09ret =3D erofs_map_dev(sb, &mdev);
> -=09if (ret)
> -=09=09goto out;
> +=09if (ret) {
> +=09=09folio_unlock(folio);
> +=09=09return ret;
> +=09}
> =20
> -=09rreq =3D erofs_fscache_alloc_request(folio_mapping(folio),
> +=09req =3D erofs_fscache_req_alloc(folio_mapping(folio),
>  =09=09=09=09folio_pos(folio), folio_size(folio));
> -=09if (IS_ERR(rreq)) {
> -=09=09ret =3D PTR_ERR(rreq);
> -=09=09goto out;
> +=09if (IS_ERR(req)) {
> +=09=09folio_unlock(folio);
> +=09=09return PTR_ERR(req);
>  =09}
> =20
> -=09return erofs_fscache_read_folios_async(mdev.m_fscache->cookie,
> -=09=09=09=09rreq, mdev.m_pa);
> -out:
> -=09folio_unlock(folio);
> +=09ret =3D erofs_fscache_read_folios_async(mdev.m_fscache->cookie,
> +=09=09=09=09req, mdev.m_pa, folio_size(folio));
> +=09if (ret)
> +=09=09req->error =3D ret;
> +
> +=09erofs_fscache_req_put(req);
>  =09return ret;
>  }
> =20
>  /*
>   * Read into page cache in the range described by (@pos, @len).
>   *
> - * On return, the caller is responsible for page unlocking if the output=
 @unlock
> - * is true, or the callee will take this responsibility through netfs_io=
_request
> - * interface.
> + * On return, if the output @unlock is true, the caller is responsible f=
or page
> + * unlocking; otherwise the callee will take this responsibility through=
 request
> + * completion.
>   *
>   * The return value is the number of bytes successfully handled, or nega=
tive
>   * error code on failure. The only exception is that, the length of the =
range
> - * instead of the error code is returned on failure after netfs_io_reque=
st is
> - * allocated, so that .readahead() could advance rac accordingly.
> + * instead of the error code is returned on failure after request is all=
ocated,
> + * so that .readahead() could advance rac accordingly.
>   */
>  static int erofs_fscache_data_read(struct address_space *mapping,
>  =09=09=09=09   loff_t pos, size_t len, bool *unlock)
>  {
>  =09struct inode *inode =3D mapping->host;
>  =09struct super_block *sb =3D inode->i_sb;
> -=09struct netfs_io_request *rreq;
> +=09struct erofs_fscache_request *req;
>  =09struct erofs_map_blocks map;
>  =09struct erofs_map_dev mdev;
>  =09struct iov_iter iter;
> @@ -314,13 +237,17 @@ static int erofs_fscache_data_read(struct address_s=
pace *mapping,
>  =09if (ret)
>  =09=09return ret;
> =20
> -=09rreq =3D erofs_fscache_alloc_request(mapping, pos, count);
> -=09if (IS_ERR(rreq))
> -=09=09return PTR_ERR(rreq);
> +=09req =3D erofs_fscache_req_alloc(mapping, pos, count);
> +=09if (IS_ERR(req))
> +=09=09return PTR_ERR(req);
> =20
>  =09*unlock =3D false;
> -=09erofs_fscache_read_folios_async(mdev.m_fscache->cookie,
> -=09=09=09rreq, mdev.m_pa + (pos - map.m_la));
> +=09ret =3D erofs_fscache_read_folios_async(mdev.m_fscache->cookie,
> +=09=09=09req, mdev.m_pa + (pos - map.m_la), count);
> +=09if (ret)
> +=09=09req->error =3D ret;
> +
> +=09erofs_fscache_req_put(req);
>  =09return count;
>  }
> =20

--=20
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

