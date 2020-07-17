Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E967D224075
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Jul 2020 18:19:12 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-nA1AXvLfOCiKcvUjuUWdRg-1; Fri, 17 Jul 2020 12:19:10 -0400
X-MC-Unique: nA1AXvLfOCiKcvUjuUWdRg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 185AE107ACCA;
	Fri, 17 Jul 2020 16:19:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04D451A7CF;
	Fri, 17 Jul 2020 16:19:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 70F8A1809554;
	Fri, 17 Jul 2020 16:19:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06HGIKkd017817 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 17 Jul 2020 12:18:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 05E9320A0536; Fri, 17 Jul 2020 16:18:20 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01D9920A0535
	for <linux-cachefs@redhat.com>; Fri, 17 Jul 2020 16:18:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6E391012440
	for <linux-cachefs@redhat.com>; Fri, 17 Jul 2020 16:18:17 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-194-Hfp5zmb4Md-lTbC2HkgrPA-1;
	Fri, 17 Jul 2020 12:18:15 -0400
X-MC-Unique: Hfp5zmb4Md-lTbC2HkgrPA-1
Received: by fieldses.org (Postfix, from userid 2815)
	id E59719C61; Fri, 17 Jul 2020 12:18:13 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org E59719C61
Date: Fri, 17 Jul 2020 12:18:13 -0400
From: "J. Bruce Fields" <bfields@fieldses.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20200717161813.GB21567@fieldses.org>
References: <20200717142541.GA21567@fieldses.org>
	<1594825849-24991-1-git-send-email-dwysocha@redhat.com>
	<3607831.1594999165@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <3607831.1594999165@warthog.procyon.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs@redhat.com, linux-nfs@vger.kernel.org,
	Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [RFC PATCH v1 0/13] Convert NFS client to new
 fscache-iter API
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Jul 17, 2020 at 04:19:25PM +0100, David Howells wrote:
> J. Bruce Fields <bfields@fieldses.org> wrote:
> 
> > Say I had a hypothetical, err, friend, who hadn't been following that
> > FS-Cache work--could you summarize the advantages it bring us?
> 
> https://lore.kernel.org/linux-nfs/159465784033.1376674.18106463693989811037.stgit@warthog.procyon.org.uk/T/#t
> 
>  - Makes the caching code a lot simpler (~2400 LoC removed, ~1000 LoDoc[*]
>    removed at the moment from fscache, cachefiles and afs).
> 
>  - Stops using bmap to work out what data is cached.  This isn't reliable with
>    modern extend-based filesystems.  A bitmap of cached granules is saved in
>    an xattr instead.
> 
>  - Uses async DIO (kiocbs) to do I/O to/from the cache rather than using
>    buffered writes (kernel_write) and pagecache snooping for read (don't ask).
> 
>    - A lot faster and less CPU intensive as there's no page-to-page copying.
> 
>    - A lot less VM pressure as it doesn't have duplicate pages in the backing
>      fs that aren't really accounted right.
> 
>  - Uses tmpfiles+link to better handle invalidation.  It will at some point
>    hopefully employ linkat(AT_LINK_REPLACE) to effect cut-over on disk rather
>    than unlink,link.

Thanks!--b.

> David
> 
> [*] The upstream docs got ReSTified, so the doc patches I have are now useless
>     and need reworking:-(.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

