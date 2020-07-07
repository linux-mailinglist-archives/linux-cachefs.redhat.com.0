Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9461A219FE3
	for <lists+linux-cachefs@lfdr.de>; Thu,  9 Jul 2020 14:19:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-EefCMYJxPTG6_qOf5UP3_g-1; Thu, 09 Jul 2020 08:19:55 -0400
X-MC-Unique: EefCMYJxPTG6_qOf5UP3_g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE1AC107ACF5;
	Thu,  9 Jul 2020 12:19:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D7B490E71;
	Thu,  9 Jul 2020 12:19:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E401284342;
	Thu,  9 Jul 2020 12:19:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 067IKQs7022211 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 7 Jul 2020 14:20:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 400331004049; Tue,  7 Jul 2020 18:20:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BB47100405F
	for <linux-cachefs@redhat.com>; Tue,  7 Jul 2020 18:20:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2C3B804ACB
	for <linux-cachefs@redhat.com>; Tue,  7 Jul 2020 18:20:22 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-341-QLJTSaU9Mh-TZyn4yADLFw-1;
	Tue, 07 Jul 2020 14:20:16 -0400
X-MC-Unique: QLJTSaU9Mh-TZyn4yADLFw-1
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
	[107.3.166.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6656420708;
	Tue,  7 Jul 2020 18:10:09 +0000 (UTC)
Date: Tue, 7 Jul 2020 11:10:08 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <20200707181008.GC839@sol.localdomain>
References: <20200703214325.31036-1-rdunlap@infradead.org>
	<20200703214325.31036-6-rdunlap@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200703214325.31036-6-rdunlap@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Thu, 09 Jul 2020 08:19:41 -0400
Cc: Jonathan Corbet <corbet@lwn.net>, "Theodore Y . Ts'o" <tytso@mit.edu>,
	linux-doc@vger.kernel.org, autofs@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-unionfs@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>,
	linux-fscrypt@vger.kernel.org, linux-cachefs@redhat.com,
	Joel Becker <jlbec@evilplan.org>, linux-fsdevel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, Ian Kent <raven@themaw.net>
Subject: Re: [Linux-cachefs] [PATCH 05/10] Documentation: filesystems:
 fsverity: drop doubled word
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Jul 03, 2020 at 02:43:20PM -0700, Randy Dunlap wrote:
> Drop the doubled word "the".
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Eric Biggers <ebiggers@kernel.org>
> Cc: Theodore Y. Ts'o <tytso@mit.edu>
> Cc: linux-fscrypt@vger.kernel.org
> ---
>  Documentation/filesystems/fsverity.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20200701.orig/Documentation/filesystems/fsverity.rst
> +++ linux-next-20200701/Documentation/filesystems/fsverity.rst
> @@ -659,7 +659,7 @@ weren't already directly answered in oth
>        retrofit existing filesystems with new consistency mechanisms.
>        Data journalling is available on ext4, but is very slow.
>  
> -    - Rebuilding the the Merkle tree after every write, which would be
> +    - Rebuilding the Merkle tree after every write, which would be
>        extremely inefficient.  Alternatively, a different authenticated
>        dictionary structure such as an "authenticated skiplist" could
>        be used.  However, this would be far more complex.

Acked-by: Eric Biggers <ebiggers@google.com>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

