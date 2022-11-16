Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4813362BCC1
	for <lists+linux-cachefs@lfdr.de>; Wed, 16 Nov 2022 12:58:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668599898;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OL6H7CM3R/ZIL56QfHUhxa22zMeuVn/05bbd5rm3KeQ=;
	b=WCerWGjU3vtLbDQJysgAqZFJpdwzEgRP4jEYt2XTcL2tM5B/nrVXgU6F/Jy9nbuCIjVns9
	+KhCbOf2CjVSO2dpkfS3uocV+vydurCkLy7zou1W2WNkH4GjtyoeX83snXfgefMWeJFu4i
	jKdxkVNU+lh38yvzS32BxP+04w5fAFY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-YiJ4tympPqOt9KNNy4sPyA-1; Wed, 16 Nov 2022 06:58:15 -0500
X-MC-Unique: YiJ4tympPqOt9KNNy4sPyA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB7F41C09C82;
	Wed, 16 Nov 2022 11:58:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EAB722024CC8;
	Wed, 16 Nov 2022 11:58:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BC6F019465A8;
	Wed, 16 Nov 2022 11:58:12 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3A7EC19465A2 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 16 Nov 2022 11:58:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 28D5635429; Wed, 16 Nov 2022 11:58:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2113B18EB4
 for <linux-cachefs@redhat.com>; Wed, 16 Nov 2022 11:58:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F104586F12E
 for <linux-cachefs@redhat.com>; Wed, 16 Nov 2022 11:58:10 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-UIQBhBhFO82cPb6ZgN7bxQ-1; Wed, 16 Nov 2022 06:58:07 -0500
X-MC-Unique: UIQBhBhFO82cPb6ZgN7bxQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 82221B81D1B;
 Wed, 16 Nov 2022 11:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6440FC433C1;
 Wed, 16 Nov 2022 11:58:03 +0000 (UTC)
Message-ID: <2b595b62f6ecd28298a860fcdc5b4941dcafd9eb.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Jingbo Xu <jefflexu@linux.alibaba.com>, xiang@kernel.org,
 chao@kernel.org,  linux-erofs@lists.ozlabs.org, linux-cachefs@redhat.com,
 dhowells@redhat.com
Date: Wed, 16 Nov 2022 06:58:01 -0500
In-Reply-To: <20221116104502.107431-2-jefflexu@linux.alibaba.com>
References: <20221116104502.107431-1-jefflexu@linux.alibaba.com>
 <20221116104502.107431-2-jefflexu@linux.alibaba.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Linux-cachefs] [PATCH v3 1/2] fscache,
 cachefiles: add prepare_ondemand_read() callback
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2022-11-16 at 18:45 +0800, Jingbo Xu wrote:
> Add prepare_ondemand_read() callback dedicated for the on-demand read
> scenario, so that callers from this scenario can be decoupled from
> netfs_io_subrequest.
>=20
> The original cachefiles_prepare_read() is now refactored to a generic
> routine accepting a parameter list instead of netfs_io_subrequest.
> There's no logic change, except that some debug info retrieved from
> netfs_io_subrequest is removed from trace_cachefiles_prep_read().
>=20
> Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
> ---
>  fs/cachefiles/io.c                | 75 ++++++++++++++++++++-----------
>  include/linux/netfs.h             |  7 +++
>  include/trace/events/cachefiles.h | 27 ++++++-----
>  3 files changed, 68 insertions(+), 41 deletions(-)
>=20
> diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
> index 000a28f46e59..3eeafef21c4e 100644
> --- a/fs/cachefiles/io.c
> +++ b/fs/cachefiles/io.c
> @@ -385,38 +385,35 @@ static int cachefiles_write(struct netfs_cache_reso=
urces *cres,
>  =09=09=09=09  term_func, term_func_priv);
>  }
> =20
> -/*
> - * Prepare a read operation, shortening it to a cached/uncached
> - * boundary as appropriate.
> - */
> -static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subr=
equest *subreq,
> -=09=09=09=09=09=09      loff_t i_size)
> +static enum netfs_io_source cachefiles_do_prepare_read(struct netfs_cach=
e_resources *cres,
> +=09=09=09=09=09loff_t *_start, size_t *_len,
> +=09=09=09=09=09unsigned long *_flags, loff_t i_size)

_start is never changed, so it should be passed by value instead of by
pointer. I'd also reverse the position of the arguments for _flags and
i_size.=A0 Otherwise, the CPU/compiler have to shuffle things around more
in cachefiles_prepare_ondemand_read before they call this.


>  {
>  =09enum cachefiles_prepare_read_trace why;
> -=09struct netfs_io_request *rreq =3D subreq->rreq;
> -=09struct netfs_cache_resources *cres =3D &rreq->cache_resources;
> -=09struct cachefiles_object *object;
> +=09struct cachefiles_object *object =3D NULL;
>  =09struct cachefiles_cache *cache;
>  =09struct fscache_cookie *cookie =3D fscache_cres_cookie(cres);
>  =09const struct cred *saved_cred;
>  =09struct file *file =3D cachefiles_cres_file(cres);
>  =09enum netfs_io_source ret =3D NETFS_DOWNLOAD_FROM_SERVER;
> +=09loff_t start =3D *_start;
> +=09size_t len =3D *_len;
>  =09loff_t off, to;
>  =09ino_t ino =3D file ? file_inode(file)->i_ino : 0;
>  =09int rc;
> =20
> -=09_enter("%zx @%llx/%llx", subreq->len, subreq->start, i_size);
> +=09_enter("%zx @%llx/%llx", len, start, i_size);
> =20
> -=09if (subreq->start >=3D i_size) {
> +=09if (start >=3D i_size) {
>  =09=09ret =3D NETFS_FILL_WITH_ZEROES;
>  =09=09why =3D cachefiles_trace_read_after_eof;
>  =09=09goto out_no_object;
>  =09}
> =20
>  =09if (test_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags)) {
> -=09=09__set_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags);
> +=09=09__set_bit(NETFS_SREQ_COPY_TO_CACHE, _flags);
>  =09=09why =3D cachefiles_trace_read_no_data;
> -=09=09if (!test_bit(NETFS_SREQ_ONDEMAND, &subreq->flags))
> +=09=09if (!test_bit(NETFS_SREQ_ONDEMAND, _flags))
>  =09=09=09goto out_no_object;
>  =09}
> =20
> @@ -437,7 +434,7 @@ static enum netfs_io_source cachefiles_prepare_read(s=
truct netfs_io_subrequest *
>  retry:
>  =09off =3D cachefiles_inject_read_error();
>  =09if (off =3D=3D 0)
> -=09=09off =3D vfs_llseek(file, subreq->start, SEEK_DATA);
> +=09=09off =3D vfs_llseek(file, start, SEEK_DATA);
>  =09if (off < 0 && off >=3D (loff_t)-MAX_ERRNO) {
>  =09=09if (off =3D=3D (loff_t)-ENXIO) {
>  =09=09=09why =3D cachefiles_trace_read_seek_nxio;
> @@ -449,21 +446,22 @@ static enum netfs_io_source cachefiles_prepare_read=
(struct netfs_io_subrequest *
>  =09=09goto out;
>  =09}
> =20
> -=09if (off >=3D subreq->start + subreq->len) {
> +=09if (off >=3D start + len) {
>  =09=09why =3D cachefiles_trace_read_found_hole;
>  =09=09goto download_and_store;
>  =09}
> =20
> -=09if (off > subreq->start) {
> +=09if (off > start) {
>  =09=09off =3D round_up(off, cache->bsize);
> -=09=09subreq->len =3D off - subreq->start;
> +=09=09len =3D off - start;
> +=09=09*_len =3D len;
>  =09=09why =3D cachefiles_trace_read_found_part;
>  =09=09goto download_and_store;
>  =09}
> =20
>  =09to =3D cachefiles_inject_read_error();
>  =09if (to =3D=3D 0)
> -=09=09to =3D vfs_llseek(file, subreq->start, SEEK_HOLE);
> +=09=09to =3D vfs_llseek(file, start, SEEK_HOLE);
>  =09if (to < 0 && to >=3D (loff_t)-MAX_ERRNO) {
>  =09=09trace_cachefiles_io_error(object, file_inode(file), to,
>  =09=09=09=09=09  cachefiles_trace_seek_error);
> @@ -471,12 +469,13 @@ static enum netfs_io_source cachefiles_prepare_read=
(struct netfs_io_subrequest *
>  =09=09goto out;
>  =09}
> =20
> -=09if (to < subreq->start + subreq->len) {
> -=09=09if (subreq->start + subreq->len >=3D i_size)
> +=09if (to < start + len) {
> +=09=09if (start + len >=3D i_size)
>  =09=09=09to =3D round_up(to, cache->bsize);
>  =09=09else
>  =09=09=09to =3D round_down(to, cache->bsize);
> -=09=09subreq->len =3D to - subreq->start;
> +=09=09len =3D to - start;
> +=09=09*_len =3D len;
>  =09}
> =20
>  =09why =3D cachefiles_trace_read_have_data;
> @@ -484,12 +483,11 @@ static enum netfs_io_source cachefiles_prepare_read=
(struct netfs_io_subrequest *
>  =09goto out;
> =20
>  download_and_store:
> -=09__set_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags);
> -=09if (test_bit(NETFS_SREQ_ONDEMAND, &subreq->flags)) {
> -=09=09rc =3D cachefiles_ondemand_read(object, subreq->start,
> -=09=09=09=09=09      subreq->len);
> +=09__set_bit(NETFS_SREQ_COPY_TO_CACHE, _flags);
> +=09if (test_bit(NETFS_SREQ_ONDEMAND, _flags)) {
> +=09=09rc =3D cachefiles_ondemand_read(object, start, len);
>  =09=09if (!rc) {
> -=09=09=09__clear_bit(NETFS_SREQ_ONDEMAND, &subreq->flags);
> +=09=09=09__clear_bit(NETFS_SREQ_ONDEMAND, _flags);
>  =09=09=09goto retry;
>  =09=09}
>  =09=09ret =3D NETFS_INVALID_READ;
> @@ -497,10 +495,32 @@ static enum netfs_io_source cachefiles_prepare_read=
(struct netfs_io_subrequest *
>  out:
>  =09cachefiles_end_secure(cache, saved_cred);
>  out_no_object:
> -=09trace_cachefiles_prep_read(subreq, ret, why, ino);
> +=09trace_cachefiles_prep_read(object, start, len, *_flags, ret, why, ino=
);
>  =09return ret;
>  }
> =20
> +/*
> + * Prepare a read operation, shortening it to a cached/uncached
> + * boundary as appropriate.
> + */
> +static enum netfs_io_source cachefiles_prepare_read(struct netfs_io_subr=
equest *subreq,
> +=09=09=09=09=09=09    loff_t i_size)
> +{
> +=09return cachefiles_do_prepare_read(&subreq->rreq->cache_resources,
> +=09=09=09&subreq->start, &subreq->len, &subreq->flags, i_size);
> +}
> +
> +/*
> + * Prepare an on-demand read operation, shortening it to a cached/uncach=
ed
> + * boundary as appropriate.
> + */
> +static enum netfs_io_source cachefiles_prepare_ondemand_read(struct netf=
s_cache_resources *cres,
> +=09=09=09loff_t start, size_t *_len, loff_t i_size)
> +{
> +=09unsigned long flags =3D 1 << NETFS_SREQ_ONDEMAND;
> +=09return cachefiles_do_prepare_read(cres, &start, _len, &flags, i_size)=
;
> +}
> +
>  /*
>   * Prepare for a write to occur.
>   */
> @@ -621,6 +641,7 @@ static const struct netfs_cache_ops cachefiles_netfs_=
cache_ops =3D {
>  =09.write=09=09=09=3D cachefiles_write,
>  =09.prepare_read=09=09=3D cachefiles_prepare_read,
>  =09.prepare_write=09=09=3D cachefiles_prepare_write,
> +=09.prepare_ondemand_read=09=3D cachefiles_prepare_ondemand_read,
>  =09.query_occupancy=09=3D cachefiles_query_occupancy,
>  };
> =20
> diff --git a/include/linux/netfs.h b/include/linux/netfs.h
> index f2402ddeafbf..d82071c37133 100644
> --- a/include/linux/netfs.h
> +++ b/include/linux/netfs.h
> @@ -267,6 +267,13 @@ struct netfs_cache_ops {
>  =09=09=09     loff_t *_start, size_t *_len, loff_t i_size,
>  =09=09=09     bool no_space_allocated_yet);
> =20
> +=09/* Prepare an on-demand read operation, shortening it to a cached/unc=
ached
> +=09 * boundary as appropriate.
> +=09 */
> +=09enum netfs_io_source (*prepare_ondemand_read)(struct netfs_cache_reso=
urces *cres,
> +=09=09=09=09=09=09      loff_t start, size_t *_len,
> +=09=09=09=09=09=09      loff_t i_size);
> +
>  =09/* Query the occupancy of the cache in a region, returning where the
>  =09 * next chunk of data starts and how long it is.
>  =09 */
> diff --git a/include/trace/events/cachefiles.h b/include/trace/events/cac=
hefiles.h
> index d8d4d73fe7b6..171c0d7f0bb7 100644
> --- a/include/trace/events/cachefiles.h
> +++ b/include/trace/events/cachefiles.h
> @@ -428,44 +428,43 @@ TRACE_EVENT(cachefiles_vol_coherency,
>  =09    );
> =20
>  TRACE_EVENT(cachefiles_prep_read,
> -=09    TP_PROTO(struct netfs_io_subrequest *sreq,
> +=09    TP_PROTO(struct cachefiles_object *obj,
> +=09=09     loff_t start,
> +=09=09     size_t len,
> +=09=09     unsigned short flags,
>  =09=09     enum netfs_io_source source,
>  =09=09     enum cachefiles_prepare_read_trace why,
>  =09=09     ino_t cache_inode),
> =20
> -=09    TP_ARGS(sreq, source, why, cache_inode),
> +=09    TP_ARGS(obj, start, len, flags, source, why, cache_inode),
> =20
>  =09    TP_STRUCT__entry(
> -=09=09    __field(unsigned int,=09=09rreq=09=09)
> -=09=09    __field(unsigned short,=09=09index=09=09)
> +=09=09    __field(unsigned int,=09=09obj=09=09)
>  =09=09    __field(unsigned short,=09=09flags=09=09)
>  =09=09    __field(enum netfs_io_source,=09source=09=09)
>  =09=09    __field(enum cachefiles_prepare_read_trace,=09why=09)
>  =09=09    __field(size_t,=09=09=09len=09=09)
>  =09=09    __field(loff_t,=09=09=09start=09=09)
> -=09=09    __field(unsigned int,=09=09netfs_inode=09)
>  =09=09    __field(unsigned int,=09=09cache_inode=09)
>  =09=09=09     ),
> =20
>  =09    TP_fast_assign(
> -=09=09    __entry->rreq=09=3D sreq->rreq->debug_id;
> -=09=09    __entry->index=09=3D sreq->debug_index;
> -=09=09    __entry->flags=09=3D sreq->flags;
> +=09=09    __entry->obj=09=3D obj ? obj->debug_id : 0;
> +=09=09    __entry->flags=09=3D flags;
>  =09=09    __entry->source=09=3D source;
>  =09=09    __entry->why=09=3D why;
> -=09=09    __entry->len=09=3D sreq->len;
> -=09=09    __entry->start=09=3D sreq->start;
> -=09=09    __entry->netfs_inode =3D sreq->rreq->inode->i_ino;
> +=09=09    __entry->len=09=3D len;
> +=09=09    __entry->start=09=3D start;
>  =09=09    __entry->cache_inode =3D cache_inode;
>  =09=09=09   ),
> =20
> -=09    TP_printk("R=3D%08x[%u] %s %s f=3D%02x s=3D%llx %zx ni=3D%x B=3D%=
x",
> -=09=09      __entry->rreq, __entry->index,
> +=09    TP_printk("o=3D%08x %s %s f=3D%02x s=3D%llx %zx B=3D%x",
> +=09=09      __entry->obj,
>  =09=09      __print_symbolic(__entry->source, netfs_sreq_sources),
>  =09=09      __print_symbolic(__entry->why, cachefiles_prepare_read_trace=
s),
>  =09=09      __entry->flags,
>  =09=09      __entry->start, __entry->len,
> -=09=09      __entry->netfs_inode, __entry->cache_inode)
> +=09=09      __entry->cache_inode)
>  =09    );
> =20
>  TRACE_EVENT(cachefiles_read,


The rest looks pretty reasonable though.
--=20
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

