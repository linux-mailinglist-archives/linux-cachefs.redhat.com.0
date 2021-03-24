Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id BD0043472E1
	for <lists+linux-cachefs@lfdr.de>; Wed, 24 Mar 2021 08:42:31 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-oVI2SKt-Pm24oPryBluEmQ-1; Wed, 24 Mar 2021 03:42:29 -0400
X-MC-Unique: oVI2SKt-Pm24oPryBluEmQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92AEC9CDA0;
	Wed, 24 Mar 2021 07:42:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 977071972B;
	Wed, 24 Mar 2021 07:42:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1B4561809C83;
	Wed, 24 Mar 2021 07:42:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12O7gKdS010004 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 24 Mar 2021 03:42:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B65C811457F8; Wed, 24 Mar 2021 07:42:20 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1DF1101B561
	for <linux-cachefs@redhat.com>; Wed, 24 Mar 2021 07:42:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B3BC802317
	for <linux-cachefs@redhat.com>; Wed, 24 Mar 2021 07:42:18 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-21-rBqBLAtAMXWLp0-XeJM9Gg-1; Wed, 24 Mar 2021 03:42:13 -0400
X-MC-Unique: rBqBLAtAMXWLp0-XeJM9Gg-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1lOy9b-0002Qw-P0; Wed, 24 Mar 2021 07:42:11 +0000
Date: Wed, 24 Mar 2021 08:42:11 +0100
From: Christian Brauner <christian.brauner@ubuntu.com>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
Message-ID: <20210324074211.tojlf25xrano2hps@wittgenstein>
References: <20210319114146.410329-1-christian.brauner@ubuntu.com>
MIME-Version: 1.0
In-Reply-To: <20210319114146.410329-1-christian.brauner@ubuntu.com>
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
Cc: linux-fsdevel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH v3] cachefiles: do not yet allow on
	idmapped mounts
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 19, 2021 at 12:41:47PM +0100, Christian Brauner wrote:
> Based on discussions (e.g. in [1]) my understanding of cachefiles and
> the cachefiles userspace daemon is that it creates a cache on a local
> filesystem (e.g. ext4, xfs etc.) for a network filesystem. The way this
> is done is by writing "bind" to /dev/cachefiles and pointing it to the
> directory to use as the cache.
> Currently this directory can technically also be an idmapped mount but
> cachefiles aren't yet fully aware of such mounts and thus don't take the
> idmapping into account when creating cache entries. This could leave
> users confused as the ownership of the files wouldn't match to what they
> expressed in the idmapping. Block cache files on idmapped mounts until
> the fscache rework is done and we have ported it to support idmapped
> mounts.
> 
> [1]: https://lore.kernel.org/lkml/20210303161528.n3jzg66ou2wa43qb@wittgenstein
> Cc: David Howells <dhowells@redhat.com>
> Cc: linux-cachefs@redhat.com
> Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
> ---

Hey David,

Are you happy with this now, and could I possibly get your Ack on this,
please? And also, are you routing this to Linus (preferably before v5.12
is out) or do you want me to take it?

Christian

> /* v2 */
> - Christian Brauner <christian.brauner@ubuntu.com>:
>   - Ensure that "root" is initialized when cleaning up.
> 
> /* v3 */
> - David Howells <dhowells@redhat.com>:
>   - Reformulate commit message to avoid paragraphs with duplicated
>     content.
>   - Add a pr_warn() when cachefiles are supposed to be created on
>     idmapped mounts.
> ---
>  fs/cachefiles/bind.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/fs/cachefiles/bind.c b/fs/cachefiles/bind.c
> index dfb14dbddf51..38bb7764b454 100644
> --- a/fs/cachefiles/bind.c
> +++ b/fs/cachefiles/bind.c
> @@ -118,6 +118,12 @@ static int cachefiles_daemon_add_cache(struct cachefiles_cache *cache)
>  	cache->mnt = path.mnt;
>  	root = path.dentry;
>  
> +	ret = -EINVAL;
> +	if (mnt_user_ns(path.mnt) != &init_user_ns) {
> +		pr_warn("File cache on idmapped mounts not supported");
> +		goto error_unsupported;
> +	}
> +
>  	/* check parameters */
>  	ret = -EOPNOTSUPP;
>  	if (d_is_negative(root) ||
> 
> base-commit: 1e28eed17697bcf343c6743f0028cc3b5dd88bf0
> -- 
> 2.27.0
> 

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

