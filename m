Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 94898215A3C
	for <lists+linux-cachefs@lfdr.de>; Mon,  6 Jul 2020 17:02:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-jiYAFkvTOq2DDFzmM6StpQ-1; Mon, 06 Jul 2020 11:02:40 -0400
X-MC-Unique: jiYAFkvTOq2DDFzmM6StpQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 157B5107ACF3;
	Mon,  6 Jul 2020 15:02:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 037D010021B3;
	Mon,  6 Jul 2020 15:02:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E10881809561;
	Mon,  6 Jul 2020 15:02:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0660LOvl015630 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 5 Jul 2020 20:21:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F2A702084823; Mon,  6 Jul 2020 00:21:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE8EC2084824
	for <linux-cachefs@redhat.com>; Mon,  6 Jul 2020 00:21:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E71B685A33D
	for <linux-cachefs@redhat.com>; Mon,  6 Jul 2020 00:21:20 +0000 (UTC)
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
	[66.111.4.230]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-256-TM49oHTKOOqDAML4R-8vzg-1; Sun, 05 Jul 2020 20:21:19 -0400
X-MC-Unique: TM49oHTKOOqDAML4R-8vzg-1
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailnew.nyi.internal (Postfix) with ESMTP id 70398580332;
	Sun,  5 Jul 2020 20:15:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute2.internal (MEProxy); Sun, 05 Jul 2020 20:15:31 -0400
X-ME-Sender: <xms:IW0CXwKVeu8lGbzOlq64_A5_uFFV9vNkIYm7mP0MSrimI9UB2WhDKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvgdeftdcutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefkrghnucfm
	vghnthcuoehrrghvvghnsehthhgvmhgrfidrnhgvtheqnecuggftrfgrthhtvghrnhepfe
	efteetvdeguddvveefveeftedtffduudehueeihfeuvefgveehffeludeggfejnecukfhp
	peehkedrjedrvdeftddrvddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
	epmhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvth
X-ME-Proxy: <xmx:IW0CXwJa33pPbyJKs5j5yJJp8AVsGxsC2lc_Vn_Nn0WgjWxj9WfMHw>
	<xmx:IW0CXwt3L6lJEFZ-a435eMSG900UwVrgynIIndkpxdWRcto6-JaobA>
	<xmx:IW0CX9b9MDt0t9FCouBcea7zpCeNwSyaB2nZBRofypQ8--PuHp992A>
	<xmx:I20CX1CVjYZahSNs5yLT8Fa4eKR0D2nZXYQ0LYQaLxjYF-xToCoL_g>
Received: from mickey.themaw.net (58-7-230-200.dyn.iinet.net.au [58.7.230.200])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7F2713280063;
	Sun,  5 Jul 2020 20:15:24 -0400 (EDT)
Message-ID: <c0488eb9932989a0d932ee5ec6d66429db18db4d.camel@themaw.net>
From: Ian Kent <raven@themaw.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Date: Mon, 06 Jul 2020 08:15:21 +0800
In-Reply-To: <20200703214325.31036-2-rdunlap@infradead.org>
References: <20200703214325.31036-1-rdunlap@infradead.org>
	<20200703214325.31036-2-rdunlap@infradead.org>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Mon, 06 Jul 2020 11:02:32 -0400
Cc: Jonathan Corbet <corbet@lwn.net>, Eric Biggers <ebiggers@kernel.org>,
	linux-doc@vger.kernel.org, autofs@vger.kernel.org, Miklos,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-unionfs@vger.kernel.org, Szeredi <miklos@szeredi.hu>,
	linux-fscrypt@vger.kernel.org, linux-cachefs@redhat.com,
	Joel Becker <jlbec@evilplan.org>, linux-fsdevel@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>, Hellwig <hch@lst.de>, Christoph
Subject: Re: [Linux-cachefs] [PATCH 01/10] Documentation: filesystems:
 autofs-mount-control: drop doubled words
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2020-07-03 at 14:43 -0700, Randy Dunlap wrote:
> Drop the doubled words "the" and "and".
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Ian Kent <raven@themaw.net>

Acked-by: Ian Kent <raven@themaw.net>

> Cc: autofs@vger.kernel.org
> ---
>  Documentation/filesystems/autofs-mount-control.rst |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> --- linux-next-20200701.orig/Documentation/filesystems/autofs-mount-
> control.rst
> +++ linux-next-20200701/Documentation/filesystems/autofs-mount-
> control.rst
> @@ -391,7 +391,7 @@ variation uses the path and optionally i
>  set to an autofs mount type. The call returns 1 if this is a mount
> point
>  and sets out.devid field to the device number of the mount and
> out.magic
>  field to the relevant super block magic number (described below) or
> 0 if
> -it isn't a mountpoint. In both cases the the device number (as
> returned
> +it isn't a mountpoint. In both cases the device number (as returned
>  by new_encode_dev()) is returned in out.devid field.
>  
>  If supplied with a file descriptor we're looking for a specific
> mount,
> @@ -399,12 +399,12 @@ not necessarily at the top of the mounte
>  the descriptor corresponds to is considered a mountpoint if it is
> itself
>  a mountpoint or contains a mount, such as a multi-mount without a
> root
>  mount. In this case we return 1 if the descriptor corresponds to a
> mount
> -point and and also returns the super magic of the covering mount if
> there
> +point and also returns the super magic of the covering mount if
> there
>  is one or 0 if it isn't a mountpoint.
>  
>  If a path is supplied (and the ioctlfd field is set to -1) then the
> path
>  is looked up and is checked to see if it is the root of a mount. If
> a
>  type is also given we are looking for a particular autofs mount and
> if
> -a match isn't found a fail is returned. If the the located path is
> the
> +a match isn't found a fail is returned. If the located path is the
>  root of a mount 1 is returned along with the super magic of the
> mount
>  or 0 otherwise.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

