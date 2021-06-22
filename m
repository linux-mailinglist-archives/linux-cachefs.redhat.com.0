Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA1C3AFA5E
	for <lists+linux-cachefs@lfdr.de>; Tue, 22 Jun 2021 02:56:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-79dCX9YmMdOrw3ZtDq-R_g-1; Mon, 21 Jun 2021 20:56:09 -0400
X-MC-Unique: 79dCX9YmMdOrw3ZtDq-R_g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20E171084F53;
	Tue, 22 Jun 2021 00:56:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3C0C60936;
	Tue, 22 Jun 2021 00:56:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D80A71809C99;
	Tue, 22 Jun 2021 00:56:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15M0u10G014020 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 21 Jun 2021 20:56:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 13722202F331; Tue, 22 Jun 2021 00:56:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F1DC202F322
	for <linux-cachefs@redhat.com>; Tue, 22 Jun 2021 00:55:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F95F800182
	for <linux-cachefs@redhat.com>; Tue, 22 Jun 2021 00:55:57 +0000 (UTC)
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
	[66.111.4.224]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-216-6mmZGSCqMuG6RqjSJxEX1Q-1; Mon, 21 Jun 2021 20:55:55 -0400
X-MC-Unique: 6mmZGSCqMuG6RqjSJxEX1Q-1
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.nyi.internal (Postfix) with ESMTP id 8BE6D58093D;
	Mon, 21 Jun 2021 20:50:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute4.internal (MEProxy); Mon, 21 Jun 2021 20:50:10 -0400
X-ME-Sender: <xms:wTPRYKtZtJbOuFbH-dJm263_31JAW58FVD1iDsUvV6qzA-vzoLoRwg>
	<xme:wTPRYPfr825cBf4ZE-8XoaoMYvYnMP4wVCC4WcIc0YvDxP61E5JAXqlx3p9maH8N5
	m45oP_faZM8JzVs0iw>
X-ME-Received: <xmr:wTPRYFy67xTi8AZ3XnZ2KYzpop4KEhazwJE9rvwP6wsvGa1lDAFXfhBbQu4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeegtddggedtucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeflohhshhcu
	vfhrihhplhgvthhtuceojhhoshhhsehjohhshhhtrhhiphhlvghtthdrohhrgheqnecugg
	ftrfgrthhtvghrnhepteffkefhtdeitdfhteekfffhhfffheetfedujeeftefhjeegleeu
	ffeftdehheffnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucevlhhushhtvghruf
	hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjohhshhesjhhoshhhthhrihhp
	lhgvthhtrdhorhhg
X-ME-Proxy: <xmx:wTPRYFNtNCXasANykjYWT19lgxNPzBDO2AK2qITbz7PL3N0WeVjYTg>
	<xmx:wTPRYK_iUvBN3pk0Go6z3V2JX8hLk78_ZzU6EsG75zDpgN3jhYeC0Q>
	<xmx:wTPRYNVaLget6YQxGxUTmsvErBjefzdgiU_yEwEDTFPv2OWsnOnnbA>
	<xmx:wjPRYNaI26HXRfYEoEv0lrpEnKenDrgy-SzHKwtUfWY6cGRRyqAj93fJdhJEaFuA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
	21 Jun 2021 20:50:08 -0400 (EDT)
Date: Mon, 21 Jun 2021 17:50:07 -0700
From: Josh Triplett <josh@joshtriplett.org>
To: Andreas Dilger <adilger@dilger.ca>
Message-ID: <YNEzvwgqo6pQ50Pq@localhost>
References: <206078.1621264018@warthog.procyon.org.uk>
	<6E4DE257-4220-4B5B-B3D0-B67C7BC69BB5@dilger.ca>
	<YKntRtEUoxTEFBOM@localhost>
	<B70B57ED-6F11-45CC-B99F-86BBDE36ACA4@dilger.ca>
MIME-Version: 1.0
In-Reply-To: <B70B57ED-6F11-45CC-B99F-86BBDE36ACA4@dilger.ca>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: xfs <linux-xfs@vger.kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	"Darrick J. Wong" <djwong@kernel.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 25, 2021 at 03:13:52PM -0600, Andreas Dilger wrote:
> There was a patch pushed recently that targets "-o discard" performance:
> https://patchwork.ozlabs.org/project/linux-ext4/list/?series=244091
> that needs a bit more work, but may be worthwhile to test if it improves
> your workload, and help put some weight behind landing it?

I just got a chance to test that patch (using the same storage stack,
with ext4 atop dm-crypt on the same SSD). That patch series makes a
*massive* difference; with that patch series (rebased atop latest
5.13.0-rc7) and the test case from my previous mail, `rm -r testdir`
takes the same amount of time (~17s) whether I have discard enabled or
disabled, and doesn't disrupt the rest of the system.  Without the
patch, that same removal took many minutes, and stalled out the rest of
the system.

Thanks for the reference; I'll follow up to the thread for that patch
with the same information.

- Josh Triplett

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

