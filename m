Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8A37A21DA21
	for <lists+linux-cachefs@lfdr.de>; Mon, 13 Jul 2020 17:34:01 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-6otdAs3lMTu3QWVeMqeszA-1; Mon, 13 Jul 2020 11:33:58 -0400
X-MC-Unique: 6otdAs3lMTu3QWVeMqeszA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12DDE8014D4;
	Mon, 13 Jul 2020 15:33:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE2D45C1BB;
	Mon, 13 Jul 2020 15:33:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5967972F5F;
	Mon, 13 Jul 2020 15:33:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DFXlBm018669 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 11:33:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5711ED1BA8; Mon, 13 Jul 2020 15:33:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40CCDD74AC
	for <linux-cachefs@redhat.com>; Mon, 13 Jul 2020 15:33:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 021B7856A58
	for <linux-cachefs@redhat.com>; Mon, 13 Jul 2020 15:33:45 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-290-jOYQstsFNaGUZsdVl2OcmQ-1;
	Mon, 13 Jul 2020 11:33:39 -0400
X-MC-Unique: jOYQstsFNaGUZsdVl2OcmQ-1
Received: from lwn.net (localhost [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0E1112E2;
	Mon, 13 Jul 2020 15:33:38 +0000 (UTC)
Date: Mon, 13 Jul 2020 09:33:37 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Message-ID: <20200713093337.2f8f409a@lwn.net>
In-Reply-To: <20200713113705.33773-1-grandmaster@al2klimov.de>
References: <20200713113705.33773-1-grandmaster@al2klimov.de>
Organization: LWN.net
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06DFXlBm018669
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs@redhat.com, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH] docs: filesystems: Replace HTTP links
	with HTTPS ones
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 13 Jul 2020 13:37:05 +0200
"Alexander A. Klimov" <grandmaster@al2klimov.de> wrote:

>  Documentation/filesystems/caching/cachefiles.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/filesystems/caching/cachefiles.rst b/Documentation/filesystems/caching/cachefiles.rst
> index 65d3db476765..e58bc1fd312a 100644
> --- a/Documentation/filesystems/caching/cachefiles.rst
> +++ b/Documentation/filesystems/caching/cachefiles.rst
> @@ -348,7 +348,7 @@ data cached therein; nor is it permitted to create new files in the cache.
>  
>  There are policy source files available in:
>  
> -	http://people.redhat.com/~dhowells/fscache/cachefilesd-0.8.tar.bz2
> +	https://people.redhat.com/~dhowells/fscache/cachefilesd-0.8.tar.bz2
>  
>  and later versions.  In that tarball, see the files::

Applied, thanks.

jon


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

