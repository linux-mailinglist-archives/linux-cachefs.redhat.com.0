Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 43EA8387343
	for <lists+linux-cachefs@lfdr.de>; Tue, 18 May 2021 09:24:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621322680;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9tQ5v3A5pR9lXjinYap5An8NaJCNON/3vMxfo8tXk1U=;
	b=Xs0RPaTnL+uWK4AhMjn+uDJm7Uj4UFS44XR8tKOFbZgbZEoHK5nglVWh79ein9KHneLNCO
	XDebbM966eo1ljxlotirR5WCl01Uiqrh6z9vdbKA5Ykl2YXWZApFlNFgRZ8dMm7yS+Zdxg
	AhzzAxaxe0MlLwbjk4fmGfwsF1vKDFw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-YcS_pDg_MkWjE7DB0fy0_A-1; Tue, 18 May 2021 03:24:38 -0400
X-MC-Unique: YcS_pDg_MkWjE7DB0fy0_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D67E51009465;
	Tue, 18 May 2021 07:24:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17B6F5C239;
	Tue, 18 May 2021 07:24:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 46C1D55344;
	Tue, 18 May 2021 07:24:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14I7OPXD012075 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 18 May 2021 03:24:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BC033690F1; Tue, 18 May 2021 07:24:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-217.rdu2.redhat.com
	[10.10.112.217])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3548B59463;
	Tue, 18 May 2021 07:24:20 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210517232237.GE2893@dread.disaster.area>
References: <20210517232237.GE2893@dread.disaster.area>
	<206078.1621264018@warthog.procyon.org.uk>
To: Dave Chinner <david@fromorbit.com>
MIME-Version: 1.0
Date: Tue, 18 May 2021 08:24:19 +0100
Message-ID: <272939.1621322659@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 14I7OPXD012075
X-loop: linux-cachefs@redhat.com
Cc: linux-xfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	"Darrick J. Wong" <djwong@kernel.org>, Chris Mason <clm@fb.com>,
	linux-cachefs@redhat.com, Andreas Dilger <adilger.kernel@dilger.ca>,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Linux-cachefs] How capacious and well-indexed are ext4,
	xfs and btrfs directories?
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <272938.1621322659.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dave Chinner <david@fromorbit.com> wrote:

> > What I'd like to do is remove the fanout directories, so that for each logical
> > "volume"[*] I have a single directory with all the files in it.  But that
> > means sticking massive amounts of entries into a single directory and hoping
> > it (a) isn't too slow and (b) doesn't hit the capacity limit.
> 
> Note that if you use a single directory, you are effectively single
> threading modifications to your file index. You still need to use
> fanout directories if you want concurrency during modification for
> the cachefiles index, but that's a different design criteria
> compared to directory capacity and modification/lookup scalability.

I knew there was something I was overlooking.  This might be a more important
criterion.  I should try benchmarking this, see what difference it makes
eliminating the extra lookup step (which is probably cheap) versus the
concurrency.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

