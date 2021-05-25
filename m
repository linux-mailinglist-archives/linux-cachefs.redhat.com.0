Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id E1C6038F9E1
	for <lists+linux-cachefs@lfdr.de>; Tue, 25 May 2021 07:21:33 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-ggCZ-hCUOy2GjjRODfm9rw-1; Tue, 25 May 2021 01:21:26 -0400
X-MC-Unique: ggCZ-hCUOy2GjjRODfm9rw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFD03802B78;
	Tue, 25 May 2021 05:21:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60C2C59447;
	Tue, 25 May 2021 05:21:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3654B55341;
	Tue, 25 May 2021 05:21:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14P5KBKZ008772 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 25 May 2021 01:20:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9FA709E91; Tue, 25 May 2021 05:20:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A4A59E8F
	for <linux-cachefs@redhat.com>; Tue, 25 May 2021 05:20:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 097AA833959
	for <linux-cachefs@redhat.com>; Tue, 25 May 2021 05:20:09 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-568-_bHRbQcZNLafSf8ANkpKDA-1; Tue, 25 May 2021 01:20:07 -0400
X-MC-Unique: _bHRbQcZNLafSf8ANkpKDA-1
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1llPBb-0038Z5-A5; Tue, 25 May 2021 05:01:07 +0000
Date: Tue, 25 May 2021 06:00:59 +0100
From: Christoph Hellwig <hch@infradead.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <YKyEi06Y8uNCr9BE@infradead.org>
References: <206078.1621264018@warthog.procyon.org.uk>
	<6E4DE257-4220-4B5B-B3D0-B67C7BC69BB5@dilger.ca>
	<YKntRtEUoxTEFBOM@localhost> <20210525042136.GA202068@locust>
MIME-Version: 1.0
In-Reply-To: <20210525042136.GA202068@locust>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: Andreas Dilger <adilger@dilger.ca>, xfs <linux-xfs@vger.kernel.org>,
	Theodore Ts'o <tytso@mit.edu>, Josh Triplett <josh@joshtriplett.org>,
	NeilBrown <neilb@suse.com>, Chris Mason <clm@fb.com>,
	linux-cachefs@redhat.com, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Ext4 Developers List <linux-ext4@vger.kernel.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 24, 2021 at 09:21:36PM -0700, Darrick J. Wong wrote:
> Synchronous discard is slow, even on NVME.

That really depends on the device.  Some are specifically optimized for
that workload due to customer requirements.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

