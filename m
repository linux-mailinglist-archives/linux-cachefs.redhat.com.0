Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 800482405D8
	for <lists+linux-cachefs@lfdr.de>; Mon, 10 Aug 2020 14:26:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597062391;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=FOa/ZGwS3bVKpm26ZxkG7ImV1q+remRqd3BzBxRyezE=;
	b=HIz608Ydg+2Ik4x8Fw6Mg/Y25as3zvNaXbyB93gntWEHqcYktooQYOWzwXjlBxbhwQDsp2
	+hsBKbocYzZ+PgV7oRizIBSbr3zhIBB1uZhg4IwqnK5m/LXmp7/VPU//u9MN3sZgqataCV
	iJc9uve8QTjbGTZVqBPDJ+9eI5sivGk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-7Ft_64QiOjK4oFoTDnWXrQ-1; Mon, 10 Aug 2020 08:26:29 -0400
X-MC-Unique: 7Ft_64QiOjK4oFoTDnWXrQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5CEC80047A;
	Mon, 10 Aug 2020 12:26:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 542E188F3C;
	Mon, 10 Aug 2020 12:26:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 49F7297557;
	Mon, 10 Aug 2020 12:26:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07ACOv9I016217 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 08:24:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 97F1A10F1BED; Mon, 10 Aug 2020 12:24:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8ABB110F1BEB
	for <linux-cachefs@redhat.com>; Mon, 10 Aug 2020 12:24:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42230805C1B
	for <linux-cachefs@redhat.com>; Mon, 10 Aug 2020 12:24:54 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
	[209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-45-ZenBtIkJMX-VRXxOImzEyg-1; Mon, 10 Aug 2020 08:24:52 -0400
X-MC-Unique: ZenBtIkJMX-VRXxOImzEyg-1
Received: by mail-ed1-f71.google.com with SMTP id c3so3141187edm.7
	for <linux-cachefs@redhat.com>; Mon, 10 Aug 2020 05:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4VPTIyjQNatVrz2VI5RQx2AT8TlRCkUDjcaMy9xwpg8=;
	b=FklJeyH4U5tGSIRB3Akr6E96MmaQP9wAe6Kz+HIcV2bbPuFM4MBnatOZuzeanmR3wn
	/c65P1H6OxZADocqY4P2z6dagHrAZAoe9qIGn2q05hQPHB/Sn89W2xY+SW25BBoF5A3I
	+lHfuCzEaBjAscaixGqv/Iw3AWS4zZ3yyH3Fi31iis2iVv/tTrvpEAkumlyeC7mEdU2n
	/RAMEBR3qktOfRCq/WYFtx35EvNyYwXKOvSp6jMNGizCzlU52OQaVnd8cyWW8MB8Ao8/
	Kx9sNzPs3/lCflng49cwqke8mU1IKZg3l2fhB3CppobgB28T4iCIi8FNHI+jvyBnln8X
	VG3Q==
X-Gm-Message-State: AOAM531VHcXe+TZBYwOKfeL+y4UIUTk4lr79F1ejXxlz0FPRBc8/Ufyx
	5564nLFeLWBBNhN6R0IzCVI3DBfG30O7z+sqRNxuj7NKPR6WtJuLmK5e6gk71Ni+vk7asifwYYC
	YyLjYBew8pVEg3b7a5AiiettV7iM+J54tZ5OHww==
X-Received: by 2002:a17:906:f202:: with SMTP id
	gt2mr20809416ejb.70.1597062290987; 
	Mon, 10 Aug 2020 05:24:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6NcnlRx+gWMAH6n6n32ohWZ+kmzr6P2P2AjBXSySl16e/qj8u/joyJDbVruYQCoj8QMzqAP/6DO1lTY6mw0s=
X-Received: by 2002:a17:906:f202:: with SMTP id
	gt2mr20809400ejb.70.1597062290725; 
	Mon, 10 Aug 2020 05:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200731130421.127022-1-jlayton@kernel.org>
	<20200731130421.127022-10-jlayton@kernel.org>
	<CALF+zOnS9faaap1pZ_HfPzy2q4R_+HP84S02GxhrzWMD1WOYtg@mail.gmail.com>
	<b0f10cd60aa33d0bcc63e18a81410b9b8db298fa.camel@kernel.org>
In-Reply-To: <b0f10cd60aa33d0bcc63e18a81410b9b8db298fa.camel@kernel.org>
From: David Wysochanski <dwysocha@redhat.com>
Date: Mon, 10 Aug 2020 08:24:14 -0400
Message-ID: <CALF+zOnEhBHdHvKnmTEKb8KHi8G92G_CHNUwHaOoJmS5_vVNOQ@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: ceph-devel@vger.kernel.org, linux-cachefs@redhat.com, idryomov@gmail.com
Subject: Re: [Linux-cachefs] [RFC PATCH v2 09/11] ceph: convert readpages to
	fscache_read_helper
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="00000000000086129f05ac850a2c"

--00000000000086129f05ac850a2c
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 10, 2020 at 7:09 AM Jeff Layton <jlayton@kernel.org> wrote:
>
> On Sun, 2020-08-09 at 11:09 -0400, David Wysochanski wrote:
> > On Fri, Jul 31, 2020 at 9:05 AM Jeff Layton <jlayton@kernel.org> wrote:
> > > Convert ceph_readpages to use the fscache_read_helper. With this we can
> > > rip out a lot of the old readpage/readpages infrastructure.
> > >
> > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > > ---
> > >  fs/ceph/addr.c | 209 +++++++------------------------------------------
> > >  1 file changed, 28 insertions(+), 181 deletions(-)
> > >
> > > diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> > > index cee497c108bb..8905fe4a0930 100644
> > > --- a/fs/ceph/addr.c
> > > +++ b/fs/ceph/addr.c
> > > @@ -377,76 +377,23 @@ static int ceph_readpage(struct file *filp, struct page *page)
> > >         return err;
> > >  }
> > >
> > > -/*
> > > - * Finish an async read(ahead) op.
> > > - */
> > > -static void finish_read(struct ceph_osd_request *req)
> > > -{
> > > -       struct inode *inode = req->r_inode;
> > > -       struct ceph_fs_client *fsc = ceph_inode_to_client(inode);
> > > -       struct ceph_osd_data *osd_data;
> > > -       int rc = req->r_result <= 0 ? req->r_result : 0;
> > > -       int bytes = req->r_result >= 0 ? req->r_result : 0;
> > > -       int num_pages;
> > > -       int i;
> > > -
> > > -       dout("finish_read %p req %p rc %d bytes %d\n", inode, req, rc, bytes);
> > > -       if (rc == -EBLACKLISTED)
> > > -               ceph_inode_to_client(inode)->blacklisted = true;
> > > -
> > > -       /* unlock all pages, zeroing any data we didn't read */
> > > -       osd_data = osd_req_op_extent_osd_data(req, 0);
> > > -       BUG_ON(osd_data->type != CEPH_OSD_DATA_TYPE_PAGES);
> > > -       num_pages = calc_pages_for((u64)osd_data->alignment,
> > > -                                       (u64)osd_data->length);
> > > -       for (i = 0; i < num_pages; i++) {
> > > -               struct page *page = osd_data->pages[i];
> > > -
> > > -               if (rc < 0 && rc != -ENOENT)
> > > -                       goto unlock;
> > > -               if (bytes < (int)PAGE_SIZE) {
> > > -                       /* zero (remainder of) page */
> > > -                       int s = bytes < 0 ? 0 : bytes;
> > > -                       zero_user_segment(page, s, PAGE_SIZE);
> > > -               }
> > > -               dout("finish_read %p uptodate %p idx %lu\n", inode, page,
> > > -                    page->index);
> > > -               flush_dcache_page(page);
> > > -               SetPageUptodate(page);
> > > -unlock:
> > > -               unlock_page(page);
> > > -               put_page(page);
> > > -               bytes -= PAGE_SIZE;
> > > -       }
> > > -
> > > -       ceph_update_read_latency(&fsc->mdsc->metric, req->r_start_latency,
> > > -                                req->r_end_latency, rc);
> > > -
> > > -       kfree(osd_data->pages);
> > > -}
> > > -
> > > -/*
> > > - * start an async read(ahead) operation.  return nr_pages we submitted
> > > - * a read for on success, or negative error code.
> > > - */
> > > -static int start_read(struct inode *inode, struct ceph_rw_context *rw_ctx,
> > > -                     struct list_head *page_list, int max)
> > > +static int ceph_readpages(struct file *file, struct address_space *mapping,
> > > +                         struct list_head *page_list, unsigned nr_pages)
> > >  {
> > > -       struct ceph_osd_client *osdc =
> > > -               &ceph_inode_to_client(inode)->client->osdc;
> > > +       struct inode *inode = file_inode(file);
> > >         struct ceph_inode_info *ci = ceph_inode(inode);
> > > -       struct page *page = lru_to_page(page_list);
> > > -       struct ceph_vino vino;
> > > -       struct ceph_osd_request *req;
> > > -       u64 off;
> > > -       u64 len;
> > > -       int i;
> > > -       struct page **pages;
> > > -       pgoff_t next_index;
> > > -       int nr_pages = 0;
> > > +       struct ceph_fs_client *fsc = ceph_inode_to_client(inode);
> > > +       struct ceph_file_info *fi = file->private_data;
> > > +       struct ceph_rw_context *rw_ctx;
> > > +       struct fscache_cookie *cookie = ceph_fscache_cookie(ci);
> > >         int got = 0;
> > >         int ret = 0;
> > > +       int max = fsc->mount_options->rsize >> PAGE_SHIFT;
> >
> > Have you ran tests with different values of rsize?
> > Specifically, rsize < readahead_size == size_of_readpages
> >
> > I'm seeing a lot of problems with NFS when varying rsize are used wrt
> > readahead values.  Specifically I'm seeing panics because fscache
> > expects a 1:1 mapping of issue_op() to io_done() calls, and I get
> > panics because multiple read completions are trying to unlock the
> > same pages inside fscache_read_done().
> >
> > My understanding is afs does not have such 'rsize' limitation, so it
> > may not be an area that is well tested.  It could be my implementation
> > of the NFS conversion though, as I thinkwhat needs to happen is the
> > respect the above 1:1 mapping of issue_op() to io_done() calls, and my
> > initial implementation did not do that.
> >
> > FWIW, specifically this unit test was originally failing for me with a panic.
> > Sun 09 Aug 2020 11:03:22 AM EDT: 1. On NFS client, install and enable
> > cachefilesd
> > Sun 09 Aug 2020 11:03:22 AM EDT: 2. On NFS client, mount -o
> > vers=4.1,fsc,rsize=16384 127.0.0.1:/export/dir1 /mnt/dir1
> > Sun 09 Aug 2020 11:03:22 AM EDT: 3. On NFS client, dd if=/dev/zero
> > of=/mnt/dir1/file1.bin bs=65536 count=1
> > Sun 09 Aug 2020 11:03:22 AM EDT: 4. On NFS client, echo 3 >
> > /proc/sys/vm/drop_caches
> > Sun 09 Aug 2020 11:03:22 AM EDT: 5. On NFS client, ./nfs-readahead.sh
> > set /mnt/dir1 65536
> > Sun 09 Aug 2020 11:03:23 AM EDT: 8. On NFS client, echo 3 >
> > /proc/sys/vm/drop_caches
> > Sun 09 Aug 2020 11:03:23 AM EDT: 9. On NFS client, dd
> > if=/mnt/dir1/file1.bin of=/dev/null
> >
> >
>
> I haven't tested much with varying rsize and wsize (setting them on
> cephfs is pretty rare), but I'll plan to. What's in nfs-readahead.sh?
>
>

See attached.

--00000000000086129f05ac850a2c
Content-Type: application/x-shellscript; name="nfs-readahead.sh"
Content-Disposition: attachment; filename="nfs-readahead.sh"
Content-Transfer-Encoding: base64
Content-ID: <f_kdohmi9h0>
X-Attachment-Id: f_kdohmi9h0

IyEvYmluL2Jhc2gKIyBzaG93fHNldHxkaXNhYmxlIHJlYWRhaGVhZCBmb3IgYSBzcGVjaWZpYyBt
b3VudCBwb2ludAojIFVzZWZ1bCBmb3IgdGhpbmdzIGxpa2UgTkZTIGFuZCBpZiB5b3UgZG9uJ3Qg
a25vdyAvIGNhcmUgYWJvdXQgdGhlIGJhY2tpbmcgZGV2aWNlCiMKIyBUbyB0aGUgZXh0ZW50IHBv
c3NpYmxlIHVuZGVyIGxhdywgUmVkIEhhdCwgSW5jLiBoYXMgZGVkaWNhdGVkIGFsbCBjb3B5cmln
aHQKIyB0byB0aGlzIHNvZnR3YXJlIHRvIHRoZSBwdWJsaWMgZG9tYWluIHdvcmxkd2lkZSwgcHVy
c3VhbnQgdG8gdGhlCiMgQ0MwIFB1YmxpYyBEb21haW4gRGVkaWNhdGlvbi4gVGhpcyBzb2Z0d2Fy
ZSBpcyBkaXN0cmlidXRlZCB3aXRob3V0IGFueSB3YXJyYW50eS4KIyBTZWUgPGh0dHA6Ly9jcmVh
dGl2ZWNvbW1vbnMub3JnL3B1YmxpY2RvbWFpbi96ZXJvLzEuMC8+LgojCkVfQkFEQVJHUz0yMgpm
dW5jdGlvbiBteXVzYWdlKCkgewogICAgICAgIGVjaG8gIlVzYWdlOiBgYmFzZW5hbWUgJDBgIHNl
dHxzaG93fGRpc2FibGUgPG1vdW50LXBvaW50PiBbcmVhZC1haGVhZC1rYl0iCn0KaWYgWyAkIyAt
Z3QgMyAtbyAkIyAtbHQgMiBdOyB0aGVuCiAgICAgICAgbXl1c2FnZQogICAgICAgIGV4aXQgJEVf
QkFEQVJHUwpmaQpNTlQ9JHsyJS99CkJERVY9JChncmVwICRNTlQgL3Byb2Mvc2VsZi9tb3VudGlu
Zm8gfCBhd2sgJ3sgcHJpbnQgJDMgfScpCmlmIFsgJCMgLWVxIDMgLWEgJDEgPT0gInNldCIgXTsg
dGhlbgogICAgICAgIGVjaG8gJDMgPiAvc3lzL2NsYXNzL2JkaS8kQkRFVi9yZWFkX2FoZWFkX2ti
CmVsaWYgWyAkIyAtZXEgMiAtYSAkMSA9PSAiZGlzYWJsZSIgXTsgdGhlbgogICAgICAgIGVjaG8g
MCA+IC9zeXMvY2xhc3MvYmRpLyRCREVWL3JlYWRfYWhlYWRfa2IKZWxpZiBbICQjIC1lcSAyIC1h
ICQxID09ICJzaG93IiBdOyB0aGVuCiAgICAgICAgZWNobyAiJE1OVCAkQkRFViAvc3lzL2NsYXNz
L2JkaS8kQkRFVi9yZWFkX2FoZWFkX2tiID0gIiQoY2F0IC9zeXMvY2xhc3MvYmRpLyRCREVWL3Jl
YWRfYWhlYWRfa2IpCmVsc2UKICAgICAgICBteXVzYWdlCiAgICAgICAgZXhpdCAkRV9CQURBUkdT
CmZpCg==
--00000000000086129f05ac850a2c
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs
--00000000000086129f05ac850a2c--

