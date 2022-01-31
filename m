Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEB24A4EAE
	for <lists+linux-cachefs@lfdr.de>; Mon, 31 Jan 2022 19:43:37 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-ecfGm2AMNKuVDrzQoRwsyg-1; Mon, 31 Jan 2022 13:43:35 -0500
X-MC-Unique: ecfGm2AMNKuVDrzQoRwsyg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C12918A224C;
	Mon, 31 Jan 2022 18:43:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D84D74EBE;
	Mon, 31 Jan 2022 18:43:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9A7421809CB8;
	Mon, 31 Jan 2022 18:43:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20VIhRbP022409 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 31 Jan 2022 13:43:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D2BB11121330; Mon, 31 Jan 2022 18:43:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEFFD112132C
	for <linux-cachefs@redhat.com>; Mon, 31 Jan 2022 18:43:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC29A85A5A8
	for <linux-cachefs@redhat.com>; Mon, 31 Jan 2022 18:43:24 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-117-LJhgdkaZMBW-Fzhpbpn8Hw-1; Mon, 31 Jan 2022 13:43:22 -0500
X-MC-Unique: LJhgdkaZMBW-Fzhpbpn8Hw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 93CB3B82BDA;
	Mon, 31 Jan 2022 18:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1109C340E8;
	Mon, 31 Jan 2022 18:43:19 +0000 (UTC)
Message-ID: <cc2a90295935c8841abf5d0538590eb5202a745c.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, smfrench@gmail.com
Date: Mon, 31 Jan 2022 13:43:18 -0500
In-Reply-To: <164365156782.2040161.8222945480682704501.stgit@warthog.procyon.org.uk>
References: <164365156782.2040161.8222945480682704501.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org,
	linux-cachefs@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH] cachefiles: Fix the volume coherency
	check
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2022-01-31 at 17:52 +0000, David Howells wrote:
> Fix the cache volume coherency attribute check.  It was copied from the
> file coherency check which uses as struct to lay out the xattr, and so
> needs to add a bit on to find the coherency data - but the volume coherency
> attribute only contains the coherency data, so we shouldn't be using the
> layout struct for it.
> 
> This has passed unnoticed so far because it only affects cifs at the
> moment, and cifs had its fscache component disabled.
> 
> This can now be checked by enabling CONFIG_CIFS_FSCACHE, enabling the
> following tracepoint:
> 
> 	/sys/kernel/debug/tracing/events/cachefiles/cachefiles_vol_coherency/enable
> 
> and making a cifs mount.  Without this change, the trace shows a
> cachefiles_vol_coherency line with "VOL BAD cmp" in it; with this change it
> shows "VOL OK" instead.
> 
> Fixes: 32e150037dce ("fscache, cachefiles: Store the volume coherency data")
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jeff Layton <jlayton@kernel.org>
> cc: Steve French <smfrench@gmail.com>
> cc: linux-cifs@vger.kernel.org
> cc: linux-cachefs@redhat.com
> ---
> 
>  fs/cachefiles/xattr.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/cachefiles/xattr.c b/fs/cachefiles/xattr.c
> index 83f41bd0c3a9..c6171e818a7c 100644
> --- a/fs/cachefiles/xattr.c
> +++ b/fs/cachefiles/xattr.c
> @@ -218,10 +218,10 @@ bool cachefiles_set_volume_xattr(struct cachefiles_volume *volume)
>   */
>  int cachefiles_check_volume_xattr(struct cachefiles_volume *volume)
>  {
> -	struct cachefiles_xattr *buf;
>  	struct dentry *dentry = volume->dentry;
>  	unsigned int len = volume->vcookie->coherency_len;
>  	const void *p = volume->vcookie->coherency;
> +	void *buf;
>  	enum cachefiles_coherency_trace why;
>  	ssize_t xlen;
>  	int ret = -ESTALE;
> @@ -245,7 +245,7 @@ int cachefiles_check_volume_xattr(struct cachefiles_volume *volume)
>  					"Failed to read xattr with error %zd", xlen);
>  		}
>  		why = cachefiles_coherency_vol_check_xattr;
> -	} else if (memcmp(buf->data, p, len) != 0) {
> +	} else if (memcmp(buf, p, len) != 0) {
>  		why = cachefiles_coherency_vol_check_cmp;
>  	} else {
>  		why = cachefiles_coherency_vol_check_ok;
> 
> 

Reviewed-by: Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

