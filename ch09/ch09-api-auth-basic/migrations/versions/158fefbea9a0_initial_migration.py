"""Initial migration.

Revision ID: 158fefbea9a0
Revises: 
Create Date: 2024-02-04 16:19:51.089146

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '158fefbea9a0'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('login',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('username', sa.String(length=20), nullable=False),
    sa.Column('password', sa.String(length=255), nullable=False),
    sa.Column('role', sa.Integer(), nullable=False),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('username')
    )
    op.create_table('vaccination_center',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('vaccenterid', sa.String(length=20), nullable=False),
    sa.Column('centername', sa.String(length=100), nullable=False),
    sa.Column('telephone', sa.String(length=20), nullable=False),
    sa.Column('address', sa.String(length=100), nullable=False),
    sa.Column('city', sa.String(length=50), nullable=False),
    sa.Column('province', sa.String(length=50), nullable=False),
    sa.Column('region', sa.String(length=50), nullable=False),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('vaccenterid')
    )
    op.create_table('vaccine',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('vacid', sa.String(length=20), nullable=False),
    sa.Column('vacname', sa.String(length=50), nullable=False),
    sa.Column('vacdesc', sa.String(length=100), nullable=False),
    sa.Column('qty', sa.Integer(), nullable=False),
    sa.Column('price', sa.Double(), nullable=False),
    sa.Column('status', sa.Boolean(), nullable=False),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('vacid')
    )
    op.create_table('administrator',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('adminid', sa.String(length=12), nullable=False),
    sa.Column('username', sa.String(length=20), nullable=False),
    sa.Column('firstname', sa.String(length=50), nullable=False),
    sa.Column('midname', sa.String(length=50), nullable=False),
    sa.Column('lastname', sa.String(length=50), nullable=False),
    sa.Column('email', sa.String(length=25), nullable=False),
    sa.Column('mobile', sa.String(length=15), nullable=False),
    sa.Column('position', sa.String(length=100), nullable=False),
    sa.Column('status', sa.Boolean(), nullable=False),
    sa.Column('gender', sa.String(length=10), nullable=False),
    sa.ForeignKeyConstraint(['username'], ['login.username'], ),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('adminid')
    )
    op.create_table('doctor',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('docid', sa.String(length=12), nullable=False),
    sa.Column('username', sa.String(length=20), nullable=False),
    sa.Column('firstname', sa.String(length=50), nullable=False),
    sa.Column('midname', sa.String(length=50), nullable=False),
    sa.Column('lastname', sa.String(length=50), nullable=False),
    sa.Column('age', sa.Integer(), nullable=False),
    sa.Column('gender', sa.String(length=10), nullable=False),
    sa.Column('email', sa.String(length=25), nullable=False),
    sa.Column('mobile', sa.String(length=15), nullable=False),
    sa.Column('status', sa.Boolean(), nullable=False),
    sa.Column('vaccenterid', sa.String(length=20), nullable=False),
    sa.ForeignKeyConstraint(['username'], ['login.username'], ),
    sa.ForeignKeyConstraint(['vaccenterid'], ['vaccination_center.vaccenterid'], ),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('docid')
    )
    op.create_table('inventory',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('vacid', sa.String(length=20), nullable=False),
    sa.Column('vaccenterid', sa.String(length=20), nullable=False),
    sa.Column('date_delivered', sa.Date(), nullable=False),
    sa.ForeignKeyConstraint(['vaccenterid'], ['vaccination_center.vaccenterid'], ),
    sa.ForeignKeyConstraint(['vacid'], ['vaccine.vacid'], ),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('vacid')
    )
    op.create_table('patient',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('patientid', sa.String(length=20), nullable=False),
    sa.Column('username', sa.String(length=20), nullable=False),
    sa.Column('firstname', sa.String(length=50), nullable=False),
    sa.Column('midname', sa.String(length=50), nullable=False),
    sa.Column('lastname', sa.String(length=50), nullable=False),
    sa.Column('birthday', sa.Date(), nullable=False),
    sa.Column('age', sa.Integer(), nullable=False),
    sa.Column('address', sa.String(length=100), nullable=False),
    sa.Column('email', sa.String(length=25), nullable=False),
    sa.Column('mobile', sa.String(length=15), nullable=False),
    sa.Column('gender', sa.String(length=10), nullable=False),
    sa.ForeignKeyConstraint(['username'], ['login.username'], ),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('patientid')
    )
    op.create_table('vaccine_card',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('cardid', sa.String(length=20), nullable=False),
    sa.Column('patientid', sa.String(length=20), nullable=False),
    sa.Column('docid', sa.String(length=100), nullable=False),
    sa.Column('vacid', sa.String(length=20), nullable=False),
    sa.Column('date_vaccinated', sa.Date(), nullable=False),
    sa.ForeignKeyConstraint(['docid'], ['doctor.docid'], ),
    sa.ForeignKeyConstraint(['patientid'], ['patient.patientid'], ),
    sa.ForeignKeyConstraint(['vacid'], ['vaccine.vacid'], ),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('cardid')
    )
    op.create_table('vaccine_registration',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('vacid', sa.String(length=20), nullable=False),
    sa.Column('regcode', sa.String(length=50), nullable=False),
    sa.Column('adminid', sa.String(length=12), nullable=False),
    sa.Column('date_registration', sa.Date(), nullable=False),
    sa.ForeignKeyConstraint(['adminid'], ['administrator.adminid'], ),
    sa.ForeignKeyConstraint(['vacid'], ['vaccine.vacid'], ),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('regcode')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('vaccine_registration')
    op.drop_table('vaccine_card')
    op.drop_table('patient')
    op.drop_table('inventory')
    op.drop_table('doctor')
    op.drop_table('administrator')
    op.drop_table('vaccine')
    op.drop_table('vaccination_center')
    op.drop_table('login')
    # ### end Alembic commands ###
