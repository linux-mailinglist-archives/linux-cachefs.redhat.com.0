Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA554D2515
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Mar 2022 02:12:47 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-1uofj-JoO760bzO4ljQm4Q-1; Tue, 08 Mar 2022 20:12:43 -0500
X-MC-Unique: 1uofj-JoO760bzO4ljQm4Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A26E101AA42;
	Wed,  9 Mar 2022 01:12:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C22DE7AC3;
	Wed,  9 Mar 2022 01:12:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 632EC195F438;
	Wed,  9 Mar 2022 01:12:40 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7FC98194F4AE for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  9 Mar 2022 01:12:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4C2D72166B13; Wed,  9 Mar 2022 01:12:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 475F82166B4F
 for <linux-cachefs@redhat.com>; Wed,  9 Mar 2022 01:12:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C15F73806702
 for <linux-cachefs@redhat.com>; Wed,  9 Mar 2022 01:12:34 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-Oqq1CIKLNAWI0lK4FCpx4Q-1; Tue, 08 Mar 2022 20:12:33 -0500
X-MC-Unique: Oqq1CIKLNAWI0lK4FCpx4Q-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 68BF7B81EAD;
 Wed,  9 Mar 2022 01:03:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF2FAC340EC;
 Wed,  9 Mar 2022 01:03:56 +0000 (UTC)
Message-ID: <bc03c9acb654121f123cfff64d75c1749ff401c5.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, rohiths.msft@gmail.com
Date: Tue, 08 Mar 2022 20:03:55 -0500
In-Reply-To: <164677636135.1191348.1664733858863676368.stgit@warthog.procyon.org.uk>
References: <164677636135.1191348.1664733858863676368.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [Linux-cachefs] [PATCH] cachefiles: Fix volume coherency
 attribute
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
Cc: linux-fsdevel@vger.kernel.org, Steve French <smfrench@gmail.com>,
 linux-cachefs@redhat.com, linux-kernel@vger.kernel.org,
 linux-cifs@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2022-03-08 at 21:52 +0000, David Howells wrote:
> A network filesystem may set coherency data on a volume cookie, and if
> given, cachefiles will store this in an xattr on the directory in the cache
> corresponding to the volume.
> 
> The function that sets the xattr just stores the contents of the volume
> coherency buffer directly into the xattr, with nothing added; the checking
> function, on the other hand, has a cut'n'paste error whereby it tries to
> interpret the xattr contents as would be the xattr on an ordinary file
> (using the cachefiles_xattr struct).  This results in a failure to match
> the coherency data because the buffer ends up being shifted by 18 bytes.
> 
> Fix this by defining a structure specifically for the volume xattr and
> making both the setting and checking functions use it.
> 
> Since the volume coherency doesn't work if used, take the opportunity to
> insert a reserved field for future use, set it to 0 and check that it is 0.
> Log mismatch through the appropriate tracepoint.
> 
> Note that this only affects cifs; 9p, afs, ceph and nfs don't use the
> volume coherency data at the moment.
> 
> Fixes: 32e150037dce ("fscache, cachefiles: Store the volume coherency data")
> Reported-by: Rohith Surabattula <rohiths.msft@gmail.com>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Steve French <smfrench@gmail.com>
> cc: Jeff Layton <jlayton@kernel.org>
> cc: linux-cifs@vger.kernel.org
> cc: linux-cachefs@redhat.com
> ---
> 
>  fs/cachefiles/xattr.c             |   23 ++++++++++++++++++++---
>  include/trace/events/cachefiles.h |    2 ++
>  2 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/cachefiles/xattr.c b/fs/cachefiles/xattr.c
> index 83f41bd0c3a9..35465109d9c4 100644
> --- a/fs/cachefiles/xattr.c
> +++ b/fs/cachefiles/xattr.c
> @@ -28,6 +28,11 @@ struct cachefiles_xattr {
>  static const char cachefiles_xattr_cache[] =
>  	XATTR_USER_PREFIX "CacheFiles.cache";
>  
> +struct cachefiles_vol_xattr {
> +	__be32	reserved;	/* Reserved, should be 0 */
> +	__u8	data[];		/* netfs volume coherency data */
> +} __packed;
> +
>  /*
>   * set the state xattr on a cache file
>   */
> @@ -185,6 +190,7 @@ void cachefiles_prepare_to_write(struct fscache_cookie *cookie)
>   */
>  bool cachefiles_set_volume_xattr(struct cachefiles_volume *volume)
>  {
> +	struct cachefiles_vol_xattr *buf;
>  	unsigned int len = volume->vcookie->coherency_len;
>  	const void *p = volume->vcookie->coherency;
>  	struct dentry *dentry = volume->dentry;
> @@ -192,10 +198,17 @@ bool cachefiles_set_volume_xattr(struct cachefiles_volume *volume)
>  
>  	_enter("%x,#%d", volume->vcookie->debug_id, len);
>  
> +	len += sizeof(*buf);
> +	buf = kmalloc(len, GFP_KERNEL);
> +	if (!buf)
> +		return false;
> +	buf->reserved = cpu_to_be32(0);
> +	memcpy(buf->data, p, len);
> +
>  	ret = cachefiles_inject_write_error();
>  	if (ret == 0)
>  		ret = vfs_setxattr(&init_user_ns, dentry, cachefiles_xattr_cache,
> -				   p, len, 0);
> +				   buf, len, 0);
>  	if (ret < 0) {
>  		trace_cachefiles_vfs_error(NULL, d_inode(dentry), ret,
>  					   cachefiles_trace_setxattr_error);
> @@ -209,6 +222,7 @@ bool cachefiles_set_volume_xattr(struct cachefiles_volume *volume)
>  					       cachefiles_coherency_vol_set_ok);
>  	}
>  
> +	kfree(buf);
>  	_leave(" = %d", ret);
>  	return ret == 0;
>  }
> @@ -218,7 +232,7 @@ bool cachefiles_set_volume_xattr(struct cachefiles_volume *volume)
>   */
>  int cachefiles_check_volume_xattr(struct cachefiles_volume *volume)
>  {
> -	struct cachefiles_xattr *buf;
> +	struct cachefiles_vol_xattr *buf;
>  	struct dentry *dentry = volume->dentry;
>  	unsigned int len = volume->vcookie->coherency_len;
>  	const void *p = volume->vcookie->coherency;
> @@ -228,6 +242,7 @@ int cachefiles_check_volume_xattr(struct cachefiles_volume *volume)
>  
>  	_enter("");
>  
> +	len += sizeof(*buf);
>  	buf = kmalloc(len, GFP_KERNEL);
>  	if (!buf)
>  		return -ENOMEM;
> @@ -245,7 +260,9 @@ int cachefiles_check_volume_xattr(struct cachefiles_volume *volume)
>  					"Failed to read xattr with error %zd", xlen);
>  		}
>  		why = cachefiles_coherency_vol_check_xattr;
> -	} else if (memcmp(buf->data, p, len) != 0) {
> +	} else if (buf->reserved != cpu_to_be32(0)) {
> +		why = cachefiles_coherency_vol_check_resv;
> +	} else if (memcmp(buf->data, p, len - sizeof(*buf)) != 0) {
>  		why = cachefiles_coherency_vol_check_cmp;
>  	} else {
>  		why = cachefiles_coherency_vol_check_ok;
> diff --git a/include/trace/events/cachefiles.h b/include/trace/events/cachefiles.h
> index 002d0ae4f9bc..311c14a20e70 100644
> --- a/include/trace/events/cachefiles.h
> +++ b/include/trace/events/cachefiles.h
> @@ -56,6 +56,7 @@ enum cachefiles_coherency_trace {
>  	cachefiles_coherency_set_ok,
>  	cachefiles_coherency_vol_check_cmp,
>  	cachefiles_coherency_vol_check_ok,
> +	cachefiles_coherency_vol_check_resv,
>  	cachefiles_coherency_vol_check_xattr,
>  	cachefiles_coherency_vol_set_fail,
>  	cachefiles_coherency_vol_set_ok,
> @@ -139,6 +140,7 @@ enum cachefiles_error_trace {
>  	EM(cachefiles_coherency_set_ok,		"SET ok  ")		\
>  	EM(cachefiles_coherency_vol_check_cmp,	"VOL BAD cmp ")		\
>  	EM(cachefiles_coherency_vol_check_ok,	"VOL OK      ")		\
> +	EM(cachefiles_coherency_vol_check_resv,	"VOL BAD resv")	\
>  	EM(cachefiles_coherency_vol_check_xattr,"VOL BAD xatt")		\
>  	EM(cachefiles_coherency_vol_set_fail,	"VOL SET fail")		\
>  	E_(cachefiles_coherency_vol_set_ok,	"VOL SET ok  ")
> 
> 

Looks good.

Reviewed-by: Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

