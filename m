Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2E752704
	for <lists+linux-cachefs@lfdr.de>; Tue, 25 Jun 2019 10:47:59 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3E00213A82;
	Tue, 25 Jun 2019 08:47:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA3EA5B68D;
	Tue, 25 Jun 2019 08:47:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B978206D2;
	Tue, 25 Jun 2019 08:47:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5P7pQxn011364 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 25 Jun 2019 03:51:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D22EC60606; Tue, 25 Jun 2019 07:51:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-120-57.rdu2.redhat.com
	[10.10.120.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC7AF6085B;
	Tue, 25 Jun 2019 07:51:02 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20190624165012.GH3436@hirez.programming.kicks-ass.net>
References: <20190624165012.GH3436@hirez.programming.kicks-ass.net>
To: Peter Zijlstra <peterz@infradead.org>
MIME-Version: 1.0
Content-ID: <32378.1561449061.1@warthog.procyon.org.uk>
Date: Tue, 25 Jun 2019 08:51:01 +0100
Message-ID: <32379.1561449061@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 25 Jun 2019 04:47:27 -0400
Cc: Martin Brandenburg <martin@omnibond.com>, linux-cachefs@redhat.com,
	Mike Snitzer <snitzer@redhat.com>, linux-aio@kvack.org,
	David Airlie <airlied@linux.ie>, samba-technical@lists.samba.org,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Will Deacon <will.deacon@arm.com>,
	dri-devel@lists.freedesktop.org, Chris Mason <clm@fb.com>,
	dm-devel@redhat.com, keyrings@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>, linux-afs@lists.infradead.org,
	Alasdair Kergon <agk@redhat.com>,
	Mike Marshall <hubcap@omnibond.com>, linux-cifs@vger.kernel.org,
	rds-devel@oss.oracle.com, Andreas Gruenbacher <agruenba@redhat.com>,
	linux-rdma@vger.kernel.org, James Morris <jmorris@namei.org>,
	cluster-devel@redhat.com, Antti Palosaari <crope@iki.fi>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paul McKenney <paulmck@linux.vnet.ibm.com>,
	intel-gfx@lists.freedesktop.org, devel@lists.orangefs.org,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Santosh Shilimkar <santosh.shilimkar@oracle.com>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>, Sean Wang <sean.wang@mediatek.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Jani Nikula <jani.nikula@linux.intel.com>, linux-fsdevel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, David Sterba <dsterba@suse.com>,
	MauroCarvalho Chehab <mchehab@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	linux-arm-kernel@lists.infradead.org,
	"J. Bruce Fields" <bfields@fieldses.org>,
	linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>, Steve French <sfrench@samba.org>,
	linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
	Benjamin LaHaise <bcrl@kvack.org>, Daniel Vetter <daniel@ffwll.ch>,
	Bob Peterson <rpeterso@redhat.com>, linux-media@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-btrfs@vger.kernel.org
Subject: Re: [Linux-cachefs] [RFC][PATCH] wake_up_var() memory ordering
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Tue, 25 Jun 2019 08:47:58 +0000 (UTC)

Peter Zijlstra <peterz@infradead.org> wrote:

> I tried using wake_up_var() today and accidentally noticed that it
> didn't imply an smp_mb() and specifically requires it through
> wake_up_bit() / waitqueue_active().

Thinking about it again, I'm not sure why you need to add the barrier when
wake_up() (which this is a wrapper around) is required to impose a barrier at
the front if there's anything to wake up (ie. the wait queue isn't empty).

If this is insufficient, does it make sense just to have wake_up*() functions
do an unconditional release or full barrier right at the front, rather than it
being conditional on something being woken up?

> @@ -619,9 +614,7 @@ static int dvb_usb_fe_sleep(struct dvb_frontend *fe)
>  err:
>  	if (!adap->suspend_resume_active) {
>  		adap->active_fe = -1;

I'm wondering if there's a missing barrier here.  Should the clear_bit() on
the next line be clear_bit_unlock() or clear_bit_release()?

> -		clear_bit(ADAP_SLEEP, &adap->state_bits);
> -		smp_mb__after_atomic();
> -		wake_up_bit(&adap->state_bits, ADAP_SLEEP);
> +		clear_and_wake_up_bit(ADAP_SLEEP, &adap->state_bits);
>  	}
>  
>  	dev_dbg(&d->udev->dev, "%s: ret=%d\n", __func__, ret);
> diff --git a/fs/afs/fs_probe.c b/fs/afs/fs_probe.c
> index cfe62b154f68..377ee07d5f76 100644
> --- a/fs/afs/fs_probe.c
> +++ b/fs/afs/fs_probe.c
> @@ -18,6 +18,7 @@ static bool afs_fs_probe_done(struct afs_server *server)
>  
>  	wake_up_var(&server->probe_outstanding);
>  	clear_bit_unlock(AFS_SERVER_FL_PROBING, &server->flags);
> +	smp_mb__after_atomic();
>  	wake_up_bit(&server->flags, AFS_SERVER_FL_PROBING);
>  	return true;
>  }

Looking at this and the dvb one, does it make sense to stick the release
semantics of clear_bit_unlock() into clear_and_wake_up_bit()?

Also, should clear_bit_unlock() be renamed to clear_bit_release() (and
similarly test_and_set_bit_lock() -> test_and_set_bit_acquire()) if we seem to
be trying to standardise on that terminology.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs
